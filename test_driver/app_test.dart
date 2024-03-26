import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Currency Conversion App Tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Navigate to BTC to USD conversion screen', () async {
      final btcToUsdButtonFinder = find.byValueKey('BTC_USD_Button');
      await driver.tap(btcToUsdButtonFinder);
    });

    test('Perform a valid BTC to USD conversion', () async {
      final inputFinder = find.byValueKey('BTC-input');
      final convertButtonFinder = find.byValueKey('Convert_USD_Button');
      await driver.tap(inputFinder);
      await driver.enterText('1');
      await driver.tap(convertButtonFinder);
    });

    test('Check error handling for invalid BTC input', () async {
      final inputFinder = find.byValueKey('BTC-input');
      final convertButtonFinder = find.byValueKey('Convert_USD_Button');
      await driver.tap(inputFinder);
      await driver.enterText('invalid');
      await driver.tap(convertButtonFinder);

      final errorMessageFinder = find.byValueKey('errorMessage');
      expect(await driver.getText(errorMessageFinder), contains('Invalid'));
    });

    test('Return to main screen from BTC to USD conversion screen', () async {
      // Assuming the back button has a key 'backButton'
      final backButtonFinder = find.byValueKey('backButton');
      await driver.tap(backButtonFinder);
    });

    test('Navigate to USD to BTC conversion screen', () async {
      final usdToBtcButtonFinder = find.byValueKey('USD_BTC_Button');
      await driver.tap(usdToBtcButtonFinder);
    });

    test('Perform a valid USD to BTC conversion', () async {
      final inputFinder = find.byValueKey('USD-input');
      final convertButtonFinder = find.byValueKey('Convert_BTC_Button');
      await driver.tap(inputFinder);
      await driver.enterText('100');
      await driver.tap(convertButtonFinder);
    });

    test('Check error handling for invalid USD input', () async {
      final inputFinder = find.byValueKey('USD-input');
      final convertButtonFinder = find.byValueKey('Convert_BTC_Button');
      await driver.tap(inputFinder);
      await driver.enterText('invalid');
      await driver.tap(convertButtonFinder);

      final errorMessageFinder = find.byValueKey('errorMessage');
      expect(await driver.getText(errorMessageFinder), contains('Invalid'));
    });
  });
}
