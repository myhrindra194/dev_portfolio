import 'package:flutter/material.dart';

class TechnologyChip extends StatelessWidget {
  final String label;

  const TechnologyChip({super.key, required this.label});

  IconData _getIcon() {
    switch (label.toLowerCase()) {
      case 'flutter':
        return Icons.flutter_dash;

      case 'dart':
        return Icons.code;

      case 'firebase':
        return Icons.local_fire_department;

      case 'rest api':
        return Icons.api;

      case 'json':
        return Icons.data_object;

      case 'ui/ux':
        return Icons.design_services;

      case 'provider':
        return Icons.account_tree;

      case 'firestore':
        return Icons.storage;

      default:
        return Icons.memory;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(_getIcon(), size: 18),
      label: Text(label),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      visualDensity: VisualDensity.compact,
    );
  }
}
