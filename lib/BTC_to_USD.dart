import 'package:flutter/material.dart';
import 'Converter.dart';

class BTC_to_USD extends StatefulWidget {
  @override
  State<BTC_to_USD> createState() => _BTCtoUSDState();
}

class _BTCtoUSDState extends State<BTC_to_USD> {
  final usdTextController = TextEditingController();
  String conversionResult = '';
  String errorMessage = ''; // To display an error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add a title if you want
        title: Text('BTC to USD Conversion'),
        // Leading IconButton to act as a back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          key: Key('backButton'), // Key used in tests
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (conversionResult.isNotEmpty)
                Text(
                  'USD: $conversionResult',
                  key: Key('conversionResultBTC'), // For tests
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
                  labelText: 'Enter BTC',
                  errorText:
                      null, // Make sure this is not used to show dynamic error messages
                ),
              ),
              SizedBox(height: 20), // Added space for better UI appearance
              ElevatedButton(
                key: Key('Convert_USD_Button'),
                child: Text('Convert'),
                onPressed: () {
                  final btcValue = double.tryParse(usdTextController.text);
                  if (btcValue == null) {
                    setState(() {
                      errorMessage = "Invalid BTC Value";
                      conversionResult = ''; // Clear previous valid results
                    });
                  } else {
                    // If parsing is successful, convert and display the result
                    setState(() {
                      conversionResult = Converter.convertBTCtoUSD(btcValue);
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
