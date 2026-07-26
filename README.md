# Dev Portfolio

Ce projet est un portfolio d'applications Flutter conçu pour présenter des projets, naviguer entre les détails, et ajouter de nouveaux projets localement.

## Fonctionnalités

- Page d'accueil avec un message de bienvenue et les derniers projets.
- Liste de projets consultable et filtrable par statut.
- Page de détail de projet avec lien GitHub cliquable.
- Formulaire pour ajouter un nouveau projet localement.
- Thème clair / sombre basculable.
- Navigation fluide avec `go_router`.

## Structure du projet

- `lib/main.dart`
  - Point d'entrée de l'application.
  - Utilise `MaterialApp.router` pour la navigation et les thèmes.

- `lib/router/app_router.dart`
  - Définit les routes principales de l'application :
    - `/` : `HomeScreen`
    - `/projects` : `ProjectsScreen`
    - `/project/:id` : `ProjectDetailScreen`
    - `/add` : `AddProjectScreen`

- `lib/screens/`
  - `home_screen.dart` : page d'accueil et aperçu des derniers projets.
  - `projects_screen.dart` : recherche, filtre et affichage de la liste des projets.
  - `project_detail_screen.dart` : détails du projet sélectionné avec accès GitHub.
  - `add_project_screen.dart` : formulaire d'ajout de projet.

- `lib/widgets/`
  - `portfolio_scaffold.dart` : structure d'interface commune avec app bar et retour.
  - `project_card.dart` : carte de projet pour la liste et les aperçus.
  - `search_bar_widget.dart` : champ de recherche réutilisable.
  - `technology_chip.dart` : puce de technologie utilisée par les projets.

- `lib/data/project_data.dart`
  - Contient les données locales de projets.

- `lib/models/`
  - `project.dart` : modèle de données pour un projet.
  - `project_status.dart` : statut de projet (`completed`, `inProgress`, `planned`).

- `lib/theme/app_theme.dart`
  - Définit les thèmes clair et sombre.
  - Gère le basculement du mode d'affichage.

## Dépendances principales

- `go_router` : navigation déclarative.
- `intl` : formatage de dates.
- `url_launcher` : ouverture de liens GitHub externes.

## Installation et lancement

1. Clonez le dépôt GitHub :
   ```bash
   git clone https://github.com/myhrindra194/dev_portfolio.git
   ```

2. Placez-vous dans le dossier du projet :
   ```bash
   cd 'dev_portfolio'
   ```

3. Vérifiez que Flutter est installé et configuré :
   ```bash
   flutter --version
   ```

4. Installez les dépendances :
   ```bash
   flutter pub get
   ```

5. Lancez l'application sur un émulateur ou un appareil connecté :
   ```bash
   flutter run
   ```

6. Pour analyser le projet :
   ```bash
   flutter analyze
   ```

## Remarques

- Ce portfolio fonctionne principalement avec des données locales définies dans `lib/data/project_data.dart`.
- Le formulaire d'ajout de projet ajoute les projets en mémoire uniquement pendant l'exécution.
- Les liens GitHub s'ouvrent dans le navigateur avec `url_launcher`.

## À personnaliser

- Ajouter un stockage persistant pour sauvegarder les projets.
- Étendre les écrans avec des images ou un média enrichi.
- Ajouter un tri et un filtrage plus avancés pour les projets.

