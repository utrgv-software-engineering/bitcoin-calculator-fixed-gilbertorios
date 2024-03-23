class Converter {
  static double BtctoUsdRate = 64000;
  String _value;

  Converter(String value) {
    _value = value;
  }

  String word() {
    return _value;
  }

  String convertBTCtoUSD(value) {
    final double usdAmount = value * 0.00064;
    return ("$usdAmount");
  }

  String convertUsdtoBTD(value) {
    final double btcAmount = value * 64000;
    return ("$btcAmount");
  }
}
