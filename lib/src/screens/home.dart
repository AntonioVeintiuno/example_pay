import 'package:example_pay/src/screens/cardForm.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Pay'),),
      body: Container(
        child: CardForm()
      ),
    );
  }
}