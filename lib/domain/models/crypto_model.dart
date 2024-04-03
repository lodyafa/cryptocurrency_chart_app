
class CryptoModel {
  final String? symbol;
  final dynamic usdPrice;

  CryptoModel({
    this.symbol,
    this.usdPrice,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json, String? symbol) {
    return CryptoModel(
      symbol: symbol,
      usdPrice: json["USD"],
    );
  }
}