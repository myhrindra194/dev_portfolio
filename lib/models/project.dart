import 'package:dev_portfolio/models/project_status.dart';

class Project {
  final String id;
  final String title;
  final String description;
  final List<String> technologies;
  final String githubUrl;
  final DateTime createdAt;
  final ProjectStatus status;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.technologies,
    required this.githubUrl,
    required this.createdAt,
    required this.status,
  });
}
