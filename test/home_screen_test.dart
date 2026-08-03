import 'package:dev_portfolio/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home screen shows the welcome content', (tester) async {
    await tester.pumpWidget(const DevPortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('Bonjour 👋'), findsOneWidget);
    expect(find.text('Derniers projets'), findsOneWidget);
    expect(find.text('Voir tous les projets'), findsOneWidget);
  });
}
