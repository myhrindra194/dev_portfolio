import 'package:dev_portfolio/models/project.dart';
import 'package:dev_portfolio/models/project_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Project creation and copyWith', () {
    final now = DateTime.now();
    final p = Project(
      id: '1',
      title: 'Demo',
      description: 'A demo project',
      technologies: ['Flutter'],
      githubUrl: 'https://github.com',
      createdAt: now,
      status: ProjectStatus.completed,
    );

    final p2 = p.copyWith(title: 'Demo 2');

    expect(p2.title, 'Demo 2');
    expect(p2.description, p.description);
  });
}
