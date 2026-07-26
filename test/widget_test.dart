import 'package:dev_portfolio/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app launches with portfolio content', (tester) async {
    await tester.pumpWidget(const DevPortfolioApp());

    expect(find.text('Bonjour 👋'), findsOneWidget);
    expect(find.text('Mes statistiques'), findsOneWidget);
  });
}
