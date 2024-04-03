import 'dart:convert';
import 'dart:developer';

import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/data/http_client.dart';
import 'package:cryptocurrency_chart_app/domain/api_config.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';

typedef CryptocurrencyRepoPattern<T> = (ApiException?, T?);

extension CryptocurrencyRepoPatternX<T> on CryptocurrencyRepoPattern<T> {
  ApiException? get failure => $1;

  T? get value => $2;
}

class CryptoRepository {
  final AppHttpClient _appHttpClient = AppHttpClient();

  static String _cryptoSymbolsFromList(List<String> cryptoSymbols) {
    String resString = "";
    for (int i = 0; i < cryptoSymbols.length; i++) {
      resString += cryptoSymbols[i];
      if (i + 1 < cryptoSymbols.length) {
        resString += ",";
      }
    }
    return resString;
  }

  Future<CryptocurrencyRepoPattern<List<CryptoModel>>> getCryptoModels(
      {required List<String> cryptoSymbols}) async {
    try {
      String fsyms = _cryptoSymbolsFromList(cryptoSymbols);
      String url =
          "${ApiConfig.baseUrl}${ApiConfig.priceMultiPath}?fsyms=$fsyms&tsyms=USD";
      final Uri uri = Uri.parse(url);

      final response = await _appHttpClient.get(uri: uri);
      final responseBody = json.decode(response.body);

      List<CryptoModel> cryptoModels = [];
      for (String symbol in cryptoSymbols) {
        cryptoModels.add(
          CryptoModel.fromJson(responseBody[symbol], symbol),
        );
      }

      return (null, cryptoModels);
    } on ApiException catch (exception) {
      return (exception, null);
    } catch (exception) {
      log(exception.toString());
      return (ApiException.unknown, null);
    }
  }
}