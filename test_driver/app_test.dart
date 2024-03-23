// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Should tap USD to BTC button', () async {
      final USD_Buttonfinder = find.byValueKey('USD_BTC_Button');

      await driver.tap(USD_Buttonfinder);
    });

    test('Should tap BTC to USD button', () async {
      final BTC_Buttonfinder = find.byValueKey('BTC_USD_Button');

      await driver.tap(BTC_Buttonfinder);
    });

    test('When I press USD to BTC I should go to the USD to BTC Screen',
        () async {
      final USD_Buttonfinder = find.byValueKey('USD_BTC_Button');
      final BTC_Convert_Buttonfinder = find.byValueKey('Covert_BTC_Button');

      await driver.tap(USD_Buttonfinder);
      driver.tap(BTC_Convert_Buttonfinder);
    });

    test("When i press BTC to USD i should go to the BTC to USD Screen",
        () async {
      final BTC_Buttonfinder = find.byValueKey('BTC_USD_Button');
      final USD_Convert_Buttonfinder = find.byValueKey('Covert_USD_Button');

      await driver.tap(BTC_Buttonfinder);
      await driver.tap(USD_Convert_Buttonfinder);
    });

//testWidgets("Should see 2 widgets", (WidgetTester tester))
//await tester.pumpWidget
    // Test to see one widget:
    // expect(find.byKey(buttonKey), findsOneWidget)

    /*test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });*/
  });
}
