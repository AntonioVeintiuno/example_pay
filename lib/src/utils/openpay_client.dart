import 'dart:convert';
import 'package:dio/dio.dart';

/// A Calculator.
class OpenPayClient {
  static const String _sandbox_url = "https://sandbox-api.openpay.mx/v1/";
  static const String _production_url = "https://api.openpay.mx/v1/";

  String _merchantId;
  String _privateKey;
  String _apiendpoint;
  bool _production = false;
  int _timeoutSeconds;
  Dio _httpClient;

  OpenPayClient(this._merchantId, this._privateKey, {production = false}) {
    this._production = production;
    if (this._production)
      _apiendpoint = _production_url;
    else
      _apiendpoint = _sandbox_url;
      _timeoutSeconds = 120;

    // Here is the encode for the private key that is sent in the header
    var bytes = utf8.encode("$_privateKey:");
    var base64Str = base64.encode(bytes);
    // Here is the petition to the openpay api with the Dio bookstore which is for apis consumption.
    // Can be seen where the header basic is sent for authentication
    _httpClient = Dio(BaseOptions(
      baseUrl: _apiendpoint,
      connectTimeout: _timeoutSeconds * 1000,
      receiveTimeout: _timeoutSeconds * 1000,
      headers: {"Authorization": "Basic $base64Str"}));
  }

  String get apiMerchandId => _merchantId;
  String get apiendpoint => _apiendpoint;
  bool get isProduction => _production;

  Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    Response response;
    Map<String, dynamic> jsonResponse;

    try {
      response = await _httpClient.post(_apiendpoint + endpoint, data: data.toJson(),);
    } catch (ex) {
      _handleWebException(ex, endpoint, "POST");
    }

    print('htpclient POST status : $response.statusCode');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the call to the server was successful, parse the JSON
      jsonResponse = response.data;
      return jsonResponse;
    } else {
      // If that call was not successful, throw an error.
      var responseStr = response.data.toString();
      _handleWebResponse(response, endpoint, "POST");
    }
  }

  Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    Response response;
    Map<String, dynamic> jsonResponse;

    try {
      response = await _httpClient.put(_apiendpoint + endpoint, data: data);
    } catch (ex) {
      _handleWebException(ex, endpoint, "POST");
    }
    print('htpclient PUT status : $response.statusCode');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      jsonResponse = response.data;
      return jsonResponse;
    } else {
      // If that call was not successful, throw an error.
      _handleWebResponse(response, endpoint, "POST");
    }
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    Response response;
    Map<String, dynamic> jsonResponse;

    try {
      response = await _httpClient.get(_apiendpoint + endpoint);
    } catch (ex) {
      _handleWebException(ex, endpoint, "POST");
    }

    print('htpclient GET request status : ${response.statusCode}');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      jsonResponse = response.data;
      return jsonResponse;
    } else {
      // If that call was not successful, throw an error.
      _handleWebResponse(response, endpoint, "POST");
    }
  }

  Future<List<dynamic>> getList(String endpoint) async {
    Response response;
    List<dynamic> jsonResponse;

    try {
      response = await _httpClient.get(_apiendpoint + endpoint);
    } catch (ex) {
      _handleWebException(ex, endpoint, "POST");
    }

    print('htpclient GET request status : ${response.statusCode}');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      jsonResponse = response.data;
      return jsonResponse;
    } else {
      // If that call was not successful, throw an error.
      _handleWebResponse(response, endpoint, "POST");
    }
  }

  Future<bool> delete(String endpoint) async {
    Response response;
    Map<String, dynamic> jsonResponse;

    try {
      response = await _httpClient.delete(_apiendpoint + endpoint);
    } catch (ex) {
      _handleWebException(ex, endpoint, "POST");
    }

    print('htpclient DELETE status : ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 204 ) {
      // If the call to the server was successful, parse the JSON
      //jsonResponse = json.decode(response.data.toString());
      return true;
    } else {
      _handleWebResponse(response, endpoint, "POST");
    }
    return false;
  }

  _handleWebException(ex, endpoint, requestType) {
    if (ex.response != null) {
      throw Exception({
        "messge": "Error on $requestType data Method : $endpoint",
        "exception": ex.response
      });
    } else
      throw Exception({
        "messge": "Error on $requestType data Method : $endpoint ",
        "exception": ex
      });
  }

  _handleWebResponse(response, endpoint, requestType) {
    if (response != null) {
      throw Exception({
        "messge": "Error on $requestType data Method : $endpoint ",
        "exception": response
      });
    } else {}
  }
}
