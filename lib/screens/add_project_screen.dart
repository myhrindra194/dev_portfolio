import 'package:dev_portfolio/models/project.dart';
import 'package:dev_portfolio/models/project_status.dart';
import 'package:dev_portfolio/providers/project_provider.dart';
import 'package:dev_portfolio/utils/responsive_layout.dart';
import 'package:dev_portfolio/widgets/portfolio_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _githubController = TextEditingController();

  final List<String> _technologies = [];

  ProjectStatus _selectedStatus = ProjectStatus.inProgress;

  final _technologyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _githubController.dispose();
    _technologyController.dispose();

    super.dispose();
  }

  void _addTechnology() {
    final tech = _technologyController.text.trim();

    if (tech.isNotEmpty && !_technologies.contains(tech)) {
      setState(() {
        _technologies.add(tech);
        _technologyController.clear();
      });
    }
  }

  void _ensurePendingTechnology() {
    final tech = _technologyController.text.trim();
    if (tech.isNotEmpty && !_technologies.contains(tech)) {
      _technologies.add(tech);
      _technologyController.clear();
    }
  }

  void _submitForm() {
    _ensurePendingTechnology();

    if (_technologies.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ajoutez au moins une technologie.')),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      final provider = context.read<ProjectProvider>();
      final newProject = Project(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        technologies: List.unmodifiable(_technologies),
        githubUrl: _githubController.text.trim(),
        createdAt: DateTime.now(),
        status: _selectedStatus,
      );

      provider.addProject(newProject);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${newProject.title} ajouté avec succès')),
      );

      context.goNamed('projects');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final horizontalPadding = isDesktop ? 24.0 : 16.0;

    return PortfolioScaffold(
      title: 'Ajouter un projet',
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 860),
          child: ListView(
            padding: EdgeInsets.all(horizontalPadding),
            children: [
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(isDesktop ? 24 : 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nouveau projet',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Renseignez les informations pour créer un nouveau projet.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Titre du projet',
                            prefixIcon: Icon(Icons.title),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Le titre est obligatoire';
                            }
                            if (value.trim().length < 3) {
                              return 'Minimum 3 caractères';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _descriptionController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            prefixIcon: Icon(Icons.description),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'La description est obligatoire';
                            }
                            if (value.trim().length < 10) {
                              return 'Minimum 10 caractères';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _githubController,
                          decoration: const InputDecoration(
                            labelText: 'URL GitHub',
                            prefixIcon: Icon(Icons.link),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'L\'URL GitHub est obligatoire';
                            }
                            if (!value.startsWith('http')) {
                              return 'URL invalide';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Technologies',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _technologyController,
                                decoration: const InputDecoration(
                                  hintText: 'Ex: Flutter',
                                ),
                                onSubmitted: (_) => _addTechnology(),
                              ),
                            ),
                            IconButton(
                              onPressed: _addTechnology,
                              icon: const Icon(Icons.add_circle),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          children: _technologies.map((tech) {
                            return Chip(
                              label: Text(tech),
                              deleteIcon: const Icon(Icons.close),
                              onDeleted: () {
                                setState(() {
                                  _technologies.remove(tech);
                                });
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<ProjectStatus>(
                          initialValue: _selectedStatus,
                          decoration: const InputDecoration(
                            labelText: 'Statut',
                          ),
                          items: ProjectStatus.values.map((status) {
                            return DropdownMenuItem(
                              value: status,
                              child: Text(status.label),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedStatus = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _submitForm,
                            icon: const Icon(Icons.save),
                            label: const Text('Enregistrer'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
