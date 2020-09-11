import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void authLoginTest() {
  Future<void> delay([int milliseconds = 250]) async {
    await Future<void>.delayed(Duration(milliseconds: milliseconds));
  }

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

    test('Find register and recovery buttons', () async {
      await driver.waitFor(find.byValueKey('buttonRecovery'));
      await driver.waitFor(find.byValueKey('buttonRegister'));
    });

    test('Fill email address', () async {
      final _fieldEmailAddress = find.byValueKey('fieldEmailAddress');

      await driver.waitFor(_fieldEmailAddress);
      await delay();
      await driver.tap(_fieldEmailAddress);
      await driver.enterText('admin@admin.com');
    });

    test('Fill wrong password', () async {
      final _fieldPassword = find.byValueKey('fieldPassword');

      await driver.waitFor(_fieldPassword);
      await delay();
      await driver.tap(_fieldPassword);
      await driver.enterText('123456789');
    });

    test('Submit login button and verify error', () async {
      final _buttonSubmitLogin = find.byValueKey('buttonSubmitLogin');
      final _snackBarDefault = find.byValueKey('SnackBarDefault');

      await driver.waitFor(_buttonSubmitLogin);
      await delay();
      await driver.tap(_buttonSubmitLogin);
      await driver.waitFor(_snackBarDefault);
    });

    test('Fill incomplete password', () async {
      final _fieldPassword = find.byValueKey('fieldPassword');

      await driver.waitFor(_fieldPassword);
      await delay();
      await driver.tap(_fieldPassword);
      await driver.enterText('1234567');
    });

    test('Press disabled login button', () async {
      final _buttonSubmitLogin = find.byValueKey('buttonSubmitLogin');

      await driver.waitFor(_buttonSubmitLogin);
      await delay();
      await driver.tap(_buttonSubmitLogin);
    });

    test('Fill correct password', () async {
      final _fieldPassword = find.byValueKey('fieldPassword');

      await driver.waitFor(_fieldPassword);
      await delay();
      await driver.tap(_fieldPassword);
      await driver.enterText('12345678');
    });

    test('Submit login button and success', () async {
      final _buttonSubmitLogin = find.byValueKey('buttonSubmitLogin');
      final _snackBarDefault = find.byValueKey('SnackBarDefault');
      final _homePage = find.byValueKey('HomePage');

      await driver.waitFor(_buttonSubmitLogin);
      await delay();
      await driver.tap(_buttonSubmitLogin);
      await driver.waitForAbsent(_snackBarDefault);
      await delay();
      await driver.waitFor(_homePage);
    });
  });
}
