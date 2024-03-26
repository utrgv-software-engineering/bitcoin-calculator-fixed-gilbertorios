class Converter {
  static double btcToUsdRate = 64000;

  static String convertBTCtoUSD(double btcValue) {
    if (btcValue < 0) {
      // Handle invalid input by returning a specific message
      // or you could throw an Exception
      return "Invalid input";
    }
    final double usdAmount = btcValue * btcToUsdRate;
    return usdAmount.toStringAsFixed(2);
  }

  static String convertUsdtoBTC(double usdValue) {
    if (usdValue < 0) {
      // Handle invalid input by returning a specific message
      // or you could throw an Exception
      return "Invalid input";
    }
    final double btcAmount = usdValue / btcToUsdRate;
    return btcAmount.toStringAsFixed(8);
  }
}
