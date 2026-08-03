import 'package:dev_portfolio/models/project.dart';
import 'package:dev_portfolio/models/project_status.dart';

List<Project> getInitialProjects() {
  return [
    Project(
      id: '1',
      title: 'DevPortfolio',
      description:
          'Une application mobile Flutter permettant de présenter mes projets, mes compétences et mes réalisations.',
      technologies: ['Flutter', 'Dart', 'GoRouter'],
      githubUrl: 'https://github.com/user/dev-portfolio',
      createdAt: DateTime(2026, 7, 1),
      status: ProjectStatus.inProgress,
    ),
    Project(
      id: '2',
      title: 'CLI Task Manager',
      description:
          'Application en ligne de commande développée en Dart permettant de gérer des tâches avec sauvegarde JSON.',
      technologies: ['Dart', 'JSON', 'POO'],
      githubUrl: 'https://github.com/user/cli-task-manager',
      createdAt: DateTime(2026, 6, 15),
      status: ProjectStatus.completed,
    ),
    Project(
      id: '3',
      title: 'Weather App',
      description:
          'Application météo affichant les prévisions grâce à une API externe avec une interface responsive.',
      technologies: ['Flutter', 'REST API', 'Provider'],
      githubUrl: 'https://github.com/user/weather-app',
      createdAt: DateTime(2026, 5, 10),
      status: ProjectStatus.completed,
    ),
    Project(
      id: '4',
      title: 'E-commerce Mobile',
      description:
          'Application de commerce électronique avec catalogue produits, panier et gestion des utilisateurs.',
      technologies: ['Flutter', 'Firebase', 'Firestore'],
      githubUrl: 'https://github.com/user/ecommerce',
      createdAt: DateTime(2026, 4, 20),
      status: ProjectStatus.planned,
    ),
    Project(
      id: '5',
      title: 'Hackathon Platform',
      description:
          'Plateforme web permettant de gérer un hackathon interuniversitaire avec équipes et projets.',
      technologies: ['Flutter Web', 'Firebase', 'UI/UX'],
      githubUrl: 'https://github.com/user/hackathon-platform',
      createdAt: DateTime(2026, 3, 5),
      status: ProjectStatus.completed,
    ),
  ];
}
