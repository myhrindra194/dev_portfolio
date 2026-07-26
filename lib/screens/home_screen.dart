import 'package:dev_portfolio/data/project_data.dart';
import 'package:dev_portfolio/widgets/portfolio_scaffold.dart';
import 'package:dev_portfolio/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recentProjects = [...projects]
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final theme = Theme.of(context);

    return PortfolioScaffold(
      title: 'Dev Portfolio',
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed('addProject'),
        icon: const Icon(Icons.add),
        label: const Text('Ajouter un projet'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonjour 👋',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Bienvenue sur mon portfolio professionnel.',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'Découvrez mes projets récents, mes principales technologies et comment je peux vous aider à construire votre prochaine application.',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => context.pushNamed('projects'),
                  icon: const Icon(Icons.folder_open),
                  label: const Text('Voir tous les projets'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Divider(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.08),
            thickness: 1,
          ),
          const SizedBox(height: 24),
          Text('Derniers projets', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 10),
          Text(
            'Pour une première visite, voici les projets les plus récents et représentatifs.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          ...recentProjects
              .take(3)
              .map(
                (project) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProjectCard(
                    project: project,
                    onTap: () {
                      context.pushNamed(
                        'projectDetail',
                        pathParameters: {'id': project.id},
                      );
                    },
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
