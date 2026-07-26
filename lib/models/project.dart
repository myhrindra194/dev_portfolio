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

  Project copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? technologies,
    String? githubUrl,
    DateTime? createdAt,
    ProjectStatus? status,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
      githubUrl: githubUrl ?? this.githubUrl,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Project &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        _listEquals(other.technologies, technologies) &&
        other.githubUrl == githubUrl &&
        other.createdAt == createdAt &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        technologies.fold<int>(0, (p, e) => p ^ e.hashCode) ^
        githubUrl.hashCode ^
        createdAt.hashCode ^
        status.hashCode;
  }

  bool _listEquals(List a, List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
