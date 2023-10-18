import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ql_ban_hang/main.dart' as app;
import 'package:ql_ban_hang/modules/auth/login/login_screen.dart';
import 'package:ql_ban_hang/modules/splash/splash_screen.dart' as splash;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'Login test',
    () {
      testWidgets(
        'verify login screen with correct username and password',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(
              find.byKey(const Key("phone_controller")), '0965674033');
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(
              find.byKey(const Key("password_controller")), '12345678');
          await Future.delayed(const Duration(seconds: 2));
          await tester.runAsync(() async {
            await tester.tap(find.byKey(const Key("btn_login")));
          });
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle(const Duration(seconds: 1));

          await Future.delayed(const Duration(seconds: 2));
          expect(find.byType(splash.SplashScreen), findsOneWidget);
          await Future.delayed(const Duration(seconds: 2));
        },
      );
      testWidgets(
        'verify login screen with incorrect username and password',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(
              find.byKey(const Key("phone_controller")), '0965674034');
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(
              find.byKey(const Key("password_controller")), '12345678');
          await Future.delayed(const Duration(seconds: 2));
          await tester.runAsync(() async {
            await tester.tap(find.byKey(const Key("btn_login")));
          });
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle(const Duration(seconds: 1));

          await Future.delayed(const Duration(seconds: 2));
          expect(find.byType(LoginScreen), findsOneWidget);
        },
      );
    },
  );
}
