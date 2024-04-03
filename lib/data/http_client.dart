import 'dart:developer';
import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AppHttpClient {
  Future<Response> get({
    required Uri uri,
    Map<String, String>? parameters,
  }) async {
    try {
      final Response response = await http.get(uri);
      return response;
    } catch (error) {
      if (error is http.ClientException) {
        log(error.message);
        throw ApiException.network;
      } else {
        log(error.toString());
        throw ApiException.network;
      }
    }
  }
}