import 'package:flutter/material.dart';
import 'Converter.dart'; // Ensure this import is correctly pointing to your Converter class

class BTC_to_USD extends StatefulWidget {
  @override
  State<BTC_to_USD> createState() => _BTCtoUSDState();
}

class _BTCtoUSDState extends State<BTC_to_USD> {
  final btcTextController = TextEditingController();
  String conversionResult = ''; // To display the conversion result

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                key: Key('BTC-input'), // Corrected Key
                controller: btcTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter BTC',
                ),
              ),
              ElevatedButton(
                key: Key('Convert_USD_Button'), // Corrected Key
                child: Text('Convert'),
                onPressed: () {
                  // Corrected variable name and conversion call
                  double btcAmount =
                      double.tryParse(btcTextController.text) ?? 0;
                  setState(() {
                    conversionResult = Converter.convertBTCtoUSD(btcAmount);
                  });
                },
              ),
              if (conversionResult.isNotEmpty)
                Text(
                  'USD: $conversionResult',
                  key: Key('conversionResult'), // For testability
                ),
            ],
          ),
        ),
      ),
    );
  }
}
