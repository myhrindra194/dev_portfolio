import 'package:dev_portfolio/models/project_status.dart';
import 'package:flutter/foundation.dart';

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
      technologies: technologies == null
          ? List<String>.from(this.technologies)
          : List<String>.from(technologies),
      githubUrl: githubUrl ?? this.githubUrl,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'technologies': technologies,
      'githubUrl': githubUrl,
      'createdAt': createdAt.toIso8601String(),
      'status': status.name,
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      technologies: List<String>.from(json['technologies'] as List),
      githubUrl: json['githubUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: ProjectStatus.values.firstWhere(
        (value) => value.name == json['status'],
        orElse: () => ProjectStatus.inProgress,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Project &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        listEquals(other.technologies, technologies) &&
        other.githubUrl == githubUrl &&
        other.createdAt == createdAt &&
        other.status == status;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      description,
      Object.hashAll(technologies),
      githubUrl,
      createdAt,
      status,
    );
  }
}
