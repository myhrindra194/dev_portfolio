import 'package:dev_portfolio/models/project.dart';
import 'package:dev_portfolio/models/project_status.dart';
import 'package:dev_portfolio/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProjectCard displays project details', (tester) async {
    final project = Project(
      id: '1',
      title: 'Portfolio',
      description: 'A portfolio app',
      technologies: ['Flutter'],
      githubUrl: 'https://github.com/demo',
      createdAt: DateTime(2026, 1, 1),
      status: ProjectStatus.completed,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: ProjectCard(project: project)),
      ),
    );

    expect(find.text('Portfolio'), findsOneWidget);
    expect(find.text('A portfolio app'), findsOneWidget);
    expect(find.text('Flutter'), findsOneWidget);
  });
}
