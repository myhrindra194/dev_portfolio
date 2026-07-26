import 'package:flutter/material.dart';

enum ProjectStatus { completed, inProgress, planned }

extension ProjectStatusX on ProjectStatus {
  String get label {
    switch (this) {
      case ProjectStatus.completed:
        return 'Terminé';
      case ProjectStatus.inProgress:
        return 'En cours';
      case ProjectStatus.planned:
        return 'Planifié';
    }
  }

  Color get color {
    switch (this) {
      case ProjectStatus.completed:
        return Colors.green;
      case ProjectStatus.inProgress:
        return Colors.orange;
      case ProjectStatus.planned:
        return Colors.blue;
    }
  }
}
