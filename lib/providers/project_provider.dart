import 'package:dev_portfolio/data/project_data.dart';
import 'package:dev_portfolio/models/project.dart';
import 'package:flutter/foundation.dart';

class ProjectProvider extends ChangeNotifier {
  ProjectProvider({List<Project>? initialProjects}) {
    _projects = initialProjects != null
        ? List<Project>.from(initialProjects)
        : getInitialProjects();
  }

  late List<Project> _projects;

  List<Project> get projects => List.unmodifiable(_projects);

  void addProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }

  void removeProject(String id) {
    final hadItem = _projects.any((project) => project.id == id);
    _projects.removeWhere((project) => project.id == id);
    if (hadItem) {
      notifyListeners();
    }
  }

  void updateProject(Project updatedProject) {
    final index = _projects.indexWhere(
      (project) => project.id == updatedProject.id,
    );
    if (index != -1) {
      _projects[index] = updatedProject;
      notifyListeners();
    }
  }
}
