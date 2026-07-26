import 'package:dev_portfolio/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app launches with portfolio content', (tester) async {
    await tester.pumpWidget(const DevPortfolioApp());
    await tester.pumpAndSettle(); // Attendre que tout soit chargé

    // Ces textes existent dans ton HomeScreen
    expect(find.text('Bonjour 👋'), findsOneWidget);
    expect(find.text('Dev Portfolio'), findsOneWidget); // Dans l'AppBar
    expect(
      find.text('Bienvenue sur mon portfolio professionnel.'),
      findsOneWidget,
    );
    expect(find.text('Derniers projets'), findsOneWidget);
    expect(find.text('Voir tous les projets'), findsOneWidget);
    expect(find.text('Ajouter un projet'), findsOneWidget);
  });
}
