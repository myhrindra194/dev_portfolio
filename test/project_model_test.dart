import 'package:dev_portfolio/models/project.dart';
import 'package:dev_portfolio/models/project_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('equality and hashCode work with list content', () {
    final project = Project(
      id: '1',
      title: 'A',
      description: 'Desc',
      technologies: ['Flutter', 'Dart'],
      githubUrl: 'https://github.com/a',
      createdAt: DateTime(2026, 1, 1),
      status: ProjectStatus.completed,
    );

    final same = Project(
      id: '1',
      title: 'A',
      description: 'Desc',
      technologies: ['Flutter', 'Dart'],
      githubUrl: 'https://github.com/a',
      createdAt: DateTime(2026, 1, 1),
      status: ProjectStatus.completed,
    );

    expect(project, same);
    expect(project.hashCode, same.hashCode);
  });

  test('copyWith returns updated values', () {
    final project = Project(
      id: '1',
      title: 'A',
      description: 'Desc',
      technologies: ['Flutter'],
      githubUrl: 'https://github.com/a',
      createdAt: DateTime(2026, 1, 1),
      status: ProjectStatus.inProgress,
    );

    final updated = project.copyWith(title: 'B', status: ProjectStatus.planned);

    expect(updated.title, 'B');
    expect(updated.status, ProjectStatus.planned);
    expect(updated.description, 'Desc');
  });

  test('toJson and fromJson round trip', () {
    final project = Project(
      id: '1',
      title: 'A',
      description: 'Desc',
      technologies: ['Flutter'],
      githubUrl: 'https://github.com/a',
      createdAt: DateTime(2026, 1, 1),
      status: ProjectStatus.completed,
    );

    final json = project.toJson();
    final restored = Project.fromJson(json);

    expect(restored, project);
  });
}
