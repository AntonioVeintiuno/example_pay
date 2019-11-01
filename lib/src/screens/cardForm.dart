import 'package:example_pay/src/utils/openpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:example_pay/src/models/card.dart';

class CardForm extends StatefulWidget {
  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  static const platform = const MethodChannel('openpay.flutter/open_pay');
  final _cardFormKey = GlobalKey<FormState>();
  PayCard card = new PayCard();
  // static OpenPayClient get httpClient => httpClient;
  OpenpayAPI openpayAPI = OpenpayAPI('mzay3lssyozn90n0ebgy', 'sk_fd4c575505544177b7ffb42663b4cb62');
  // CustomerService customerService = CustomerService(openPay);

   // Get battery level.
  String _deviceSessionId = 'Unknown device_id.';

  Future<void> getDeviceSessionId(String merchantId, String privateKey) async {
    String deviceSessionId;
    try {
      final int result = await platform.invokeMethod('getDeviceSessionId', <String, dynamic>{
        '_merchantId': merchantId,
        '_privateKey': privateKey,
      });
      deviceSessionId = 'Session id $result .';
    } on PlatformException catch (e) {
      deviceSessionId = "Failed to get Session level: '${e.message}'.";
    }

    setState(() {
      _deviceSessionId = deviceSessionId;
    });
  }

  void onSubmited() async {
    // First validate form.
    if (this._cardFormKey.currentState.validate()) {
      _cardFormKey.currentState.save(); // Save our form now.
      print('qlq');
      print(card.toJson());

      // azcoo4so9mrv61gra2fi
      // openpayAPI.cardService.createCard(card);
      print('le deviseID');
      print(_deviceSessionId);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _cardFormKey,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 25, right: 25),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                      labelText: "Número",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12.0),
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              new BorderSide(color: Colors.yellowAccent[100])),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Inserte los datos correspondientes';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      this.card.cardNumber = value;
                    }),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 320,
                      child: TextFormField(
                        cursorColor: Colors.green,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                          hintText: "Mes",
                          labelText: "Mes",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.yellowAccent[100])),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Inserte los mdatos correspondientes';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          this.card.expirationMonth = value;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 320,
                      child: TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        cursorColor: Colors.green,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                          labelText: "Año",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0),
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.yellowAccent[100])),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Inserte los mdatos correspondientes';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          this.card.expirationYear = value;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 330,
                      child: TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        cursorColor: Colors.green,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                          labelText: "CVV",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12.0),
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.yellowAccent[100])),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Inserte los mdatos correspondientes';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          this.card.cvv2 = value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextFormField(
                  cursorColor: Colors.green,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                    labelText: "Nombre",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12.0),
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.yellowAccent[100])),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Inserte los mdatos correspondientes';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    this.card.holderName = value;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  cursorColor: Colors.green,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                    labelText: "Customer id",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12.0),
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.yellowAccent[100])),
                  ),
                  onSaved: (String value) {
                    this.card.customerId = value;
                  },
                ),
                SizedBox(height: 200),
                SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 40,
                    child: RaisedButton(
                        onPressed: onSubmited,
                        color: Colors.grey,
                        child: Text(
                          'Guardar',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: "Poppins-Medium"),
                        )))
              ],
            )
          ]),
        ));
  }
}
