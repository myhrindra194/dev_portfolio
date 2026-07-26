import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: SizedBox(
        width: double.infinity,

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),

          child: Column(
            children: [
              Icon(icon, size: 36, color: theme.colorScheme.primary),

              const SizedBox(height: 12),

              Text(
                value,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
