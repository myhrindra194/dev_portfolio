import 'package:dev_portfolio/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PortfolioScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const PortfolioScaffold({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final canGoBack = Navigator.of(context).canPop();
    final currentLocation = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri.path;
    final isRoot = currentLocation == '/';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: !isRoot
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (canGoBack) {
                    context.pop();
                  } else {
                    context.goNamed('home');
                  }
                },
              )
            : null,
        title: Text(title, style: theme.textTheme.titleMedium),
        actions: [
          IconButton(
            onPressed: AppTheme.toggleTheme,
            icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
            tooltip: isDark ? 'Mode clair' : 'Mode sombre',
          ),
        ],
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
