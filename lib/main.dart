import 'package:dev_portfolio/providers/project_provider.dart';
import 'package:dev_portfolio/router/app_router.dart';
import 'package:dev_portfolio/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DevPortfolioApp());
}

class DevPortfolioApp extends StatefulWidget {
  const DevPortfolioApp({super.key});

  @override
  State<DevPortfolioApp> createState() => _DevPortfolioAppState();
}

class _DevPortfolioAppState extends State<DevPortfolioApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProjectProvider(),
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: AppTheme.themeModeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp.router(
            title: 'Dev Portfolio',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
