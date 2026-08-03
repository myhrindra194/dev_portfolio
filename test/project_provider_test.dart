import 'package:dev_portfolio/models/project.dart';
import 'package:dev_portfolio/models/project_status.dart';
import 'package:dev_portfolio/providers/project_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProjectProvider provider;
  late Project project;

  setUp(() {
    provider = ProjectProvider(initialProjects: []);
    project = Project(
      id: 'p1',
      title: 'Demo',
      description: 'Demo project',
      technologies: ['Flutter'],
      githubUrl: 'https://github.com/demo',
      createdAt: DateTime(2026, 1, 1),
      status: ProjectStatus.inProgress,
    );
  });

  test('adds a project and notifies listeners', () {
    var notified = 0;
    provider.addListener(() => notified++);

    provider.addProject(project);

    expect(provider.projects.length, 1);
    expect(provider.projects.first.id, 'p1');
    expect(notified, 1);
  });

  test('removes a project and notifies listeners', () {
    provider.addProject(project);
    var notified = 0;
    provider.addListener(() => notified++);

    provider.removeProject('p1');

    expect(provider.projects, isEmpty);
    expect(notified, 1);
  });

  test('updates a project and notifies listeners', () {
    provider.addProject(project);
    var notified = 0;
    provider.addListener(() => notified++);

    provider.updateProject(project.copyWith(title: 'Updated'));

    expect(provider.projects.first.title, 'Updated');
    expect(notified, 1);
  });
}
