import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void authLoginTest() {
  group("[auth.login.test]", () {
    FlutterDriver driver;

    setUp(() async {
      driver = await FlutterDriver.connect();
    });

    tearDown(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('AuthLoginPage', () async {
      await driver.waitFor(find.byValueKey('AuthLoginPage'));
    });
  });
}
