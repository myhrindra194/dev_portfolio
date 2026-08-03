# Dev Portfolio

Ce projet est un portfolio d'applications Flutter conçu pour présenter des projets, naviguer entre les détails, et ajouter de nouveaux projets localement.

## Fonctionnalités

- Page d'accueil avec un message de bienvenue et les derniers projets.
- Liste de projets consultable et filtrable par statut.
- Page de détail de projet avec lien GitHub cliquable.
- Formulaire pour ajouter un nouveau projet localement.
- Thème clair / sombre basculable.
- Navigation fluide avec `go_router`.
- Gestion d'état centralisée via `Provider`.
- Interface responsive pour mobile, tablette et desktop.

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
- `provider` : gestion d'état avec `ChangeNotifier`.
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

7. Pour exécuter les tests :
   ```bash
   flutter test
   ```

## Aperçu

Voici quelques captures d'écran de l'application :

<!-- Paires Light / Dark pour les écrans principaux -->
<table>
  <tr>
    <td align="center"><strong>Home (Light)</strong></td>
    <td align="center"><strong>Home (Dark)</strong></td>
    <td align="center"><strong>Projects (Light)</strong></td>
    <td align="center"><strong>Projects (Dark)</strong></td>
  </tr>
  <tr>
    <td><img src="screenshots/homescreen-light.png" alt="Home light" width="260" /></td>
    <td><img src="screenshots/homescreen-dark.png" alt="Home dark" width="260" /></td>
    <td><img src="screenshots/project-lists-light.png" alt="Projects light" width="260" /></td>
    <td><img src="screenshots/project-lists-dark.png" alt="Projects dark" width="260" /></td>
  </tr>
  <tr>
    <td align="center"><strong>Details (Light)</strong></td>
    <td align="center"><strong>Details (Dark)</strong></td>
    <td align="center"><strong>Add (Light)</strong></td>
    <td align="center"><strong>Add (Dark)</strong></td>
  </tr>
  <tr>
    <td><img src="screenshots/project-screen-details-light.png" alt="Details light" width="260" /></td>
    <td><img src="screenshots/project-screen-details-dark.png" alt="Details dark" width="260" /></td>
    <td><img src="screenshots/add-project.png" alt="Add project" width="260" /></td>
    <td><img src="screenshots/project-added2.png" alt="Add project confirmation" width="260" /></td>
  </tr>
</table>


## Remarques

- Ce portfolio fonctionne principalement avec des données locales définies dans `lib/data/project_data.dart`.
- Le formulaire d'ajout de projet ajoute les projets via le `ProjectProvider` pour garder l'état centralisé.
- Les liens GitHub s'ouvrent dans le navigateur avec `url_launcher`.

## À personnaliser

- Ajouter un stockage persistant pour sauvegarder les projets.
- Étendre les écrans avec des images ou un média enrichi.
- Ajouter un tri et un filtrage plus avancés pour les projets.

## Architecture technique

- **Entrée**: `lib/main.dart` initialise l'application, le `ProjectProvider` et le routeur.
- **Navigation**: `go_router` via `lib/router/app_router.dart`.
- **Écrans**: composants sous `lib/screens/` (Home, Projects, ProjectDetail, Add).
- **Widgets réutilisables**: sous `lib/widgets/` (`ProjectCard`, `PortfolioScaffold`, `SearchBarWidget`).
- **État**: `lib/providers/project_provider.dart` centralise l'ajout, la suppression et la mise à jour des projets.
- **Données**: données locales dans `lib/data/project_data.dart`.

## Widgets utilisés

- `PortfolioScaffold`: structure commune avec AppBar et navigation.
- `ProjectCard`: aperçu d'un projet dans la liste.
- `SearchBarWidget`: champ de recherche réutilisable.
- `ResponsiveLayout`: utilitaire pour mobile/tablette/desktop.

## Provider, responsivité et tests

- Le `ProjectProvider` expose une liste en lecture seule et permet d'ajouter, supprimer et mettre à jour des projets avec `notifyListeners()`.
- Les écrans utilisent `context.watch()` et `context.read()` pour maintenir une architecture propre.
- La logique responsive repose sur `MediaQuery` via `lib/utils/responsive_layout.dart`.
- Les tests unitaires et widgets sont regroupés dans `test/` et exécutés automatiquement via GitHub Actions.

## Workflow GitHub Actions

Le workflow défini dans `.github/workflows/flutter.yml` installe Flutter, exécute `flutter pub get`, `flutter analyze` puis `flutter test` à chaque push et pull request.

## Prochaines améliorations

- Persistance locale (Hive / SharedPreferences / SQLite).
- Tests d'intégration et couverture complète.
- Export d'un CSV des projets.

