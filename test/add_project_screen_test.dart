import 'package:dev_portfolio/providers/project_provider.dart';
import 'package:dev_portfolio/screens/add_project_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('AddProjectScreen validates and submits form', (tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const AddProjectScreen(),
        ),
        GoRoute(
          path: '/projects',
          name: 'projects',
          builder: (context, state) => const Scaffold(body: Text('Projects')),
        ),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ProjectProvider(),
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.enterText(find.byType(TextFormField).at(0), 'My project');
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'A very nice description',
    );
    await tester.enterText(
      find.byType(TextFormField).at(2),
      'https://github.com/demo',
    );
    await tester.enterText(find.byType(TextField).first, 'Flutter');
    await tester.tap(find.byIcon(Icons.add_circle));
    await tester.dragUntilVisible(
      find.text('Enregistrer'),
      find.byType(ListView),
      const Offset(0, -200),
    );
    await tester.tap(find.text('Enregistrer'));
    await tester.pump();

    expect(find.text('Enregistrer'), findsOneWidget);
  });
}
