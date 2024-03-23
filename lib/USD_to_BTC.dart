import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/main.dart';
import 'Converter.dart';

class USD_to_BTC extends StatefulWidget {
  @override
  State<USD_to_BTC> createState() => _State();
}

class _State extends State<USD_to_BTC> {
  final usdTextController = TextEditingController();
  String conversionResult = '';
  String errorMessage = ''; // To display an error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (conversionResult.isNotEmpty)
                Text(
                  'BTC: $conversionResult',
                  key: Key('conversionResultUSD'), // For tests
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  key: Key('errorMessage'), // For testability
                  style: TextStyle(
                      color: Colors.red, fontSize: 16), // Error message styling
                ),
              SizedBox(height: 20), // Added space for better UI appearance
              TextField(
                key: Key('BTC-input'), // Corrected Key
                controller: usdTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter USD',
                  errorText:
                      null, // Make sure this is not used to show dynamic error messages
                ),
              ),
              SizedBox(height: 20), // Added space for better UI appearance
              ElevatedButton(
                key: Key('Convert_BTC_Button'),
                child: Text('Convert'),
                onPressed: () {
                  final usdValue = double.tryParse(usdTextController.text);
                  if (usdValue == null) {
                    setState(() {
                      errorMessage = "Invalid USD Value";
                      conversionResult = ''; // Clear previous valid results
                    });
                  } else {
                    // If parsing is successful, convert and display the result
                    setState(() {
                      conversionResult = Converter.convertUsdtoBTC(usdValue);
                      errorMessage = '';
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
