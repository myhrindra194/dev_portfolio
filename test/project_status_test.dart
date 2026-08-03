import 'package:dev_portfolio/models/project_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('status labels and colors are available', () {
    expect(ProjectStatus.completed.label, 'Terminé');
    expect(ProjectStatus.inProgress.label, 'En cours');
    expect(ProjectStatus.planned.label, 'Planifié');

    expect(ProjectStatus.completed.color, isNotNull);
    expect(ProjectStatus.inProgress.color, isNotNull);
    expect(ProjectStatus.planned.color, isNotNull);
  });
}
