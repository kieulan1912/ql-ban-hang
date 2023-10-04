import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quan_ly_ban_hang/main.dart' as app;
// import 'package:quan_ly_ban_hang/modules/home/home_screen.dart';
import 'package:quan_ly_ban_hang/modules/splash/splash_screen.dart' as splash;
import 'package:rxdart/rxdart.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'verify login screen with incorrect username and password',
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
      // expect(find.text('Invalid username or password'), findsOneWidget);
      // expect(find.text('Invalid username or password'), findsOneWidget);
    },
  );

  // group(
  //   'end to end test',
  //   () {
  //     testWidgets(
  //       'verify login screen with correct username and password',
  //       (tester) async {
  //         app.main();
  //         await tester.pumpAndSettle();
  //         await Future.delayed(const Duration(seconds: 2));
  //         await tester.enterText(
  //             find.byKey(const Key("phone_controller")), '0965674033');
  //         await Future.delayed(const Duration(seconds: 2));
  //         await tester.enterText(
  //             find.byKey(const Key("password_controller")), '12345678');
  //         await Future.delayed(const Duration(seconds: 2));
  //         await tester.runAsync(() async {
  //           await tester.tap(find.byKey(const Key("btn_login")));
  //         });
  //         await Future.delayed(const Duration(seconds: 2));
  //         await tester.pumpAndSettle(const Duration(seconds: 1));

  //         await Future.delayed(const Duration(seconds: 2));
  //         expect(find.byType(splash.SplashScreen), findsOneWidget);
  //       },
  //     );
  //     testWidgets(
  //       'verify login screen with incorrect username and password',
  //       (tester) async {
  //         app.main();
  //         await tester.pumpAndSettle();
  //         await Future.delayed(const Duration(seconds: 2));
  //         await tester.enterText(
  //             find.byKey(const Key("phone_controller")), 'username');
  //         await Future.delayed(const Duration(seconds: 2));
  //         await tester.enterText(
  //             find.byKey(const Key("password_controller")), 'password');
  //         await Future.delayed(const Duration(seconds: 2));
  //         await tester.runAsync(() async {
  //           await tester.tap(find.byKey(const Key("btn_login")));
  //         });
  //         await Future.delayed(const Duration(seconds: 2));
  //         await tester.pumpAndSettle(const Duration(seconds: 1));

  //         await Future.delayed(const Duration(seconds: 2));
  //         // expect(find.byType(splash.SplashScreen), findsOneWidget);
  //         expect(find.byKey(const Key("alertDialogKey")), findsOneWidget);
  //         // expect(find.text('Invalid username or password'), findsOneWidget);
  //       },
  //     );
  //   },
  // );
}
