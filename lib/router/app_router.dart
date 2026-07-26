import 'package:dev_portfolio/screens/add_project_screen.dart';
import 'package:dev_portfolio/screens/home_screen.dart';
import 'package:dev_portfolio/screens/project_detail_screen.dart';
import 'package:dev_portfolio/screens/projects_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/projects',
      name: 'projects',
      builder: (context, state) => const ProjectsScreen(),
    ),
    GoRoute(
      path: '/project/:id',
      name: 'projectDetail',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        if (id == null || id.isEmpty) {
          return const ProjectsScreen();
        }
        return ProjectDetailScreen(projectId: id);
      },
    ),
    GoRoute(
      path: '/add',
      name: 'addProject',
      builder: (context, state) => const AddProjectScreen(),
    ),
  ],
);
