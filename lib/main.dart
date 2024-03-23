import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/USD_to_BTC.dart';
import 'package:bitcoin_calculator/BTC_to_USD.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currecy Converter App',
      home: MyHomePage(title: 'Currecny Converter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          child: Text("USD to BTC"),
          key: Key("USD_BTC_Button"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => USD_to_BTC()));
          },
        ),
        ElevatedButton(
          child: Text("BTC to USD"),
          key: Key("BTC_USD_Button"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BTC_to_USD()));
          },
        ),
      ]),
    ));
  }
}
