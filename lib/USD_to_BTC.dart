import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/main.dart';

class USD_to_BTC extends StatefulWidget {
  final USD_to_BTC converter;

  USD_to_BTC({Key key, this.converter}) : super(key: key);

  @override
  State<USD_to_BTC> createState() => _State();
}

class _State extends State<USD_to_BTC> {
  final USDTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(""),
              TextField(
                key: Key('BTC-input'),
                controller: USDTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter USD',
                  errorText: "Invalid USD Value",
                ),
              ),
              ElevatedButton(
                key: Key('Covert_BTC_Button'),
                child: Text('Convert'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
