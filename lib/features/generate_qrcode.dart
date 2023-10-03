import 'package:flutter/material.dart';

class Generate_QR_Code extends StatelessWidget {
  const Generate_QR_Code({Key? key}) : super(key: key);

  void know() {
    // Define what should happen when the button is pressed
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LinkGenie QR Code Generator'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: know,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orangeAccent),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(16.0), // You can adjust this value as needed
                  ),
                ),
                child: const Text(
                  'GENERATED QR CODE',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
