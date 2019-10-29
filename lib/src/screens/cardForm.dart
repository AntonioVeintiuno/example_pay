import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardForm extends StatefulWidget {
  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final _cardFormKey = GlobalKey<FormState>();

   void onSubmited() async {
    // First validate form.
    if (this._cardFormKey.currentState.validate())  {
      _cardFormKey.currentState.save(); // Save our form now.

      // Map res = await userProvider.login(user.email, user.password);
      // if (res['ok']) {
      //   // view code response here
      // } else {

      // }
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
                  inputFormatters: [ LengthLimitingTextInputFormatter(16)],
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                    labelText: "Número",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12.0),
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.yellowAccent[100])),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Inserte los datos correspondientes';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 250,
                      child: TextFormField(
                        cursorColor: Colors.green,
                        inputFormatters: [ LengthLimitingTextInputFormatter(2)],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                          hintText: "Mes",
                          labelText: "Mes",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.yellowAccent[100])),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Inserte los mdatos correspondientes';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width:  MediaQuery.of(context).size.width - 250,
                      child: TextFormField(
                        inputFormatters: [ LengthLimitingTextInputFormatter(2)],
                        cursorColor: Colors.green,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0, top: 7.0),
                          labelText: "Año",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.yellowAccent[100])),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Inserte los mdatos correspondientes';
                          }
                          return null;
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
                        borderSide: new BorderSide(color: Colors.yellowAccent[100])),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Inserte los mdatos correspondientes';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 200),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width-40,
                  child: RaisedButton(
                    onPressed: onSubmited,
                  color: Colors.grey,
                  child: Text('Guardar',
                    style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: "Poppins-Medium" ),
                  ))
                )
              ],
            )
          ]),
      )
    );
  }
}
