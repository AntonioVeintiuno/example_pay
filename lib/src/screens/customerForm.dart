import 'package:example_pay/src/models/customer.dart';
import 'package:example_pay/src/services/customer_service.dart';
import 'package:example_pay/src/utils/openpay_client.dart';
import 'package:example_pay/src/utils/openpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _customerFormKey = GlobalKey<FormState>();
  Customer customer = Customer();
  OpenPayClient _httpClient;
  OpenPayClient get httpClient => _httpClient;
  // OpenPayClient openPay = OpenPayClient('mzay3lssyozn90n0ebgy', 'sk_fd4c575505544177b7ffb42663b4cb62');
  OpenpayAPI openpayAPI = OpenpayAPI('mzay3lssyozn90n0ebgy', 'sk_fd4c575505544177b7ffb42663b4cb62');
  // CustomerService customerService = CustomerService(openPay);

  void onSubmited() async {
    // First validate form.
    if (this._customerFormKey.currentState.validate()) {
      _customerFormKey.currentState.save(); // Save our form now.
      print('qlq');
      // customerService
      openpayAPI.customerService.create(customer);
      // OpenpayAPI.deviceSessionId('mzay3lssyozn90n0ebgy', 'sk_fd4c575505544177b7ffb42663b4cb62');
      print('res');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _customerFormKey,
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
                    labelText: "Nombre",
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
                    this.customer.name = value;
                  }
                ),
                SizedBox(height: 30),
                TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                      labelText: "Apellido",
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
                      this.customer.lastName = value;
                    }),
                    SizedBox(height: 30),
                TextFormField(
                  cursorColor: Colors.green,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                    labelText: "Correo",
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
                    this.customer.email = value;
                  },
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 300,
                      child: Column(
                        children: <Widget>[
                          Text('Require account'),
                          Radio(
                            value: true,
                            groupValue: this.customer.requiresAccount,
                            onChanged: (bool value) {
                              this.customer.requiresAccount = value;
                            },
                          ),
                        ],
                      )
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
                          // this.card.cvv2 = value;
                        },
                      ),
                    ),
                  ],
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
        )
      );
  }
}
