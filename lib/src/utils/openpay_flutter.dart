library openpay_flutter;

import 'package:example_pay/src/services/card_service.dart';
import 'package:example_pay/src/services/customer_service.dart';
import 'package:example_pay/src/utils/openpay_client.dart';
import 'package:flutter/services.dart';

/// A Calculator.
class OpenpayAPI {
  String _merchantId;
  String _privateKey;
  bool _production = false;
  OpenPayClient _client;

  static const MethodChannel _channel = const MethodChannel('openpay_flutter');

  CustomerService customerService;
  CardService cardService;
  // PaymentService payService;

  OpenpayAPI(this._merchantId, this._privateKey, {production = false}) {
    this._production = production;
    _client = OpenPayClient(_merchantId, _privateKey);
    customerService = CustomerService(_client);
    cardService = CardService(_client);
    // payService = PaymentService(_client);
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String>  deviceSessionId(String merchantId,String privateKey) async {
    final String version = await _channel.invokeMethod('getDeviceSessionId',<String, dynamic>{
        '_merchantId': merchantId,
        '_privateKey': privateKey,
      });
    return version;
  }

  static Future<bool> validateCard(String cvv, String cardNumber) async {
    final bool version = await _channel.invokeMethod('validateCardCVV',<String, dynamic>{
        'cvv': cvv,
        'cardNumber': cardNumber,
      });
    print("validate returned");
    return version;
  }

}