class DataFormatter {
  static const String _unknownCryptoLogoPath = "assets/images//unknown-crypto-logo.png";
  
  static const Map<String, String> _cryptosMap = {
    "BTC": "Bitcoin",
    "ETH": "Ethereum",
    "XRP": "Ripple",
    "LTC": "Litecoin",
    "SOL": "Solana",
    "ADA": "Cardano",
    "DOT": "Polkadot",
    "DOGE": "Dogecoin",
    "AVAX": "Avalanche",
  };

  static String cryptoSymbolToFullName({required String? cryptoSymbol}) {
    if (cryptoSymbol == null || !_cryptosMap.containsKey(cryptoSymbol)) return "Unknown";
    return _cryptosMap[cryptoSymbol] ?? "Unknown";
  }

  static String formatCryptoPrice({required double? cryptoPrice}) {
    if (cryptoPrice == null || cryptoPrice <= 0) return "0.0";

    List<String> parts = cryptoPrice.toString().split('.');

    String integerPart = parts[0];
    String formattedIntegerPart = '';
    int count = 0;
    for (int i = integerPart.length - 1; i >= 0; i--) {
      formattedIntegerPart = integerPart[i] + formattedIntegerPart;
      count++;
      if (count % 3 == 0 && i != 0) {
        formattedIntegerPart = ',$formattedIntegerPart';
      }
    }

    String formattedPrice = formattedIntegerPart;
    if (parts.length > 1) {
      formattedPrice += '.${parts[1]}';
    }

    return formattedPrice;
  }

  static String getCryptoLogoPath({required String? cryptoSymbol}) {
    if (cryptoSymbol == null || !_cryptosMap.containsKey(cryptoSymbol)) return _unknownCryptoLogoPath;
    return "assets/images/${cryptoSymbol.toLowerCase()}-logo.png";
  }
}