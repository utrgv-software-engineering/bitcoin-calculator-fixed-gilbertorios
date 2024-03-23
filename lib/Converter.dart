class Converter {
  static double btcToUsdRate = 64000; // Use camelCase for variable names

  static String convertBTCtoUSD(double btcValue) {
    final double usdAmount = btcValue * btcToUsdRate;
    return usdAmount
        .toStringAsFixed(2); // Formats the output to 2 decimal places
  }

  static String convertUsdtoBTC(double usdValue) {
    final double btcAmount = usdValue / btcToUsdRate;
    return btcAmount
        .toStringAsFixed(8); // Formats the output to 8 decimal places for BTC
  }
}
