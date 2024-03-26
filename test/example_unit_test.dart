import 'package:flutter_test/flutter_test.dart';
import 'package:bitcoin_calculator/Converter.dart';

void main() {
  group('Converter', () {
    test('convertBTCtoUSD returns correct USD amount', () {
      final result = Converter.convertBTCtoUSD(1); // Assuming 1 BTC = 64000 USD
      print('1 BTC to USD: $result');
      expect(result, '64000.00');
    });

    test('convertUsdtoBTC returns correct BTC amount', () {
      final result =
          Converter.convertUsdtoBTC(64000); // Assuming 64000 USD = 1 BTC
      print('64000 USD to BTC: $result');
      expect(result, '1.00000000');
    });

    test('convertBTCtoUSD handles invalid input gracefully', () {
      // Assuming invalid input returns "Invalid input" message
      var result = Converter.convertBTCtoUSD(-1);
      expect(result, equals("Invalid input"));
    });

    test('convertUsdtoBTC handles invalid input gracefully', () {
      // Assuming invalid input returns "Invalid input" message
      var result = Converter.convertUsdtoBTC(-1);
      expect(result, equals("Invalid input"));
    });
  });
}
