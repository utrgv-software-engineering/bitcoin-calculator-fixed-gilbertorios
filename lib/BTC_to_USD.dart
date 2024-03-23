import 'package:flutter/material.dart';

class BTC_to_USD extends StatefulWidget {
  final BTC_to_USD converter;

  BTC_to_USD({Key key, this.converter}) : super(key: key);

  @override
  State<BTC_to_USD> createState() => _State();
}

class _State extends State<BTC_to_USD> {
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
              key: Key('USD-key'),
              controller: USDTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter BTC',
                errorText: "Invalid BTC Value",
              )),
          ElevatedButton(
            key: Key('Covert_USD_Button'),
            child: Text('Convert'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BTC_to_USD()));
            },
          ),
        ]))));
  }
}
