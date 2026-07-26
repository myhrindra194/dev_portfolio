import 'package:dev_portfolio/models/project.dart';
import 'package:dev_portfolio/models/project_status.dart';
import 'package:dev_portfolio/widgets/technology_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({super.key, required this.project, this.onTap});

  Color _statusColor(BuildContext context) {
    switch (project.status) {
      case ProjectStatus.completed:
        return Colors.green;
      case ProjectStatus.inProgress:
        return Colors.orange;
      case ProjectStatus.planned:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final image = Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.folder_copy,
        size: 32,
        color: theme.colorScheme.primary,
      ),
    );

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                project.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              size: 22,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          project.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium,
        ),

        const SizedBox(height: 12),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.technologies
              .map((tech) => TechnologyChip(label: tech))
              .toList(),
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Icon(Icons.circle, size: 12, color: _statusColor(context)),

            const SizedBox(width: 6),

            Text(project.status.label, style: theme.textTheme.bodySmall),

            const SizedBox(width: 8),

            Icon(
              Icons.calendar_today,
              size: 14,
              color: theme.colorScheme.primary,
            ),

            const SizedBox(width: 4),

            Text(
              DateFormat('dd/MM/yyyy').format(project.createdAt),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 360;
              if (isNarrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [image, const SizedBox(height: 16), details],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  image,
                  const SizedBox(width: 16),
                  Expanded(child: details),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
