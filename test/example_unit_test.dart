import 'package:test/test.dart';
import 'package:bitcoin_calculator/Converter.dart';

void main() {
  group("Tests for Input Validation", () {
    test('ConvertBTCtoUSD with an input of 64000 should return 1', () {
      double value = 1;
      var result = Converter.convertBTCtoUSD(value);
      expect(result, equals(64000.00)); // Tolerance of 0.01
    });
  });
}
