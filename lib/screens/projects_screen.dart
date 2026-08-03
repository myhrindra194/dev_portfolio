import 'package:dev_portfolio/models/project.dart';
import 'package:dev_portfolio/models/project_status.dart';
import 'package:dev_portfolio/providers/project_provider.dart';
import 'package:dev_portfolio/utils/responsive_layout.dart';
import 'package:dev_portfolio/widgets/portfolio_scaffold.dart';
import 'package:dev_portfolio/widgets/project_card.dart';
import 'package:dev_portfolio/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';
  ProjectStatus? _selectedStatus;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Project> get filteredProjects {
    final provider = context.read<ProjectProvider>();
    return provider.projects.where((project) {
      final query = _searchQuery.toLowerCase();

      final matchesSearch =
          project.title.toLowerCase().contains(query) ||
          project.description.toLowerCase().contains(query) ||
          project.technologies.any(
            (tech) => tech.toLowerCase().contains(query),
          );

      final matchesStatus =
          _selectedStatus == null || project.status == _selectedStatus;

      return matchesSearch && matchesStatus;
    }).toList();
  }

  void _openProject(Project project) {
    context.pushNamed('projectDetail', pathParameters: {'id': project.id});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final horizontalPadding = isDesktop ? 24.0 : 16.0;

    return PortfolioScaffold(
      title: 'Mes projets',
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed('addProject'),
        icon: const Icon(Icons.add),
        label: const Text('Ajouter'),
      ),
      body: ListView(
        padding: EdgeInsets.all(horizontalPadding),
        children: [
          Text('Rechercher et filtrer', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBarWidget(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ProjectStatus?>(
                  initialValue: _selectedStatus,
                  decoration: const InputDecoration(
                    labelText: 'Filtrer par statut',
                  ),
                  items: [
                    const DropdownMenuItem<ProjectStatus?>(
                      value: null,
                      child: Text('Tous'),
                    ),
                    ...ProjectStatus.values.map((status) {
                      return DropdownMenuItem<ProjectStatus?>(
                        value: status,
                        child: Text(status.label),
                      );
                    }),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${filteredProjects.length} résultat${filteredProjects.length > 1 ? 's' : ''}',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          if (filteredProjects.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  'Aucun projet trouvé.',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            )
          else if (!isTablet)
            ...filteredProjects.map((project) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ProjectCard(
                  project: project,
                  onTap: () => _openProject(project),
                ),
              );
            })
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isDesktop ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2.3,
              ),
              itemCount: filteredProjects.length,
              itemBuilder: (context, index) {
                final project = filteredProjects[index];
                return ProjectCard(
                  project: project,
                  onTap: () => _openProject(project),
                );
              },
            ),
          const SizedBox(height: 30),
          Text(
            'Balayez vers la droite ou utilisez le bouton retour pour revenir en arrière.',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
