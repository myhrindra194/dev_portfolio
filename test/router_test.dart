import 'package:dev_portfolio/router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('router has expected initial route', () {
    expect(appRouter.routeInformationProvider.value.uri.path, '/');
  });
}
