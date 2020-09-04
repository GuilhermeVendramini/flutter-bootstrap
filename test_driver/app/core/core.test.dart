import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void coreTest() {
  group("[core.test]", () {
    FlutterDriver driver;

    setUp(() async {
      driver = await FlutterDriver.connect();
    });

    tearDown(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('CoreModule', () async {
      await driver.waitFor(find.byValueKey('CoreModule'));
    });

    test('MaterialApp', () async {
      await driver.waitFor(find.byValueKey('MaterialApp'));
    });
  });
}
