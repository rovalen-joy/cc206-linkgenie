import 'package:flutter/material.dart';

class input_and_color_selection extends StatelessWidget {
  const input_and_color_selection({Key? key}) : super(key: key);

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20), // Spacing from the top for padding
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  ),
                  child: const Text(
                    'URL',
                  ),
                ),
                SizedBox(width: 10), // Spacing between the URL and Text buttons
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  ),
                  child: const Text(
                    'Text',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Spacing between the textfield and buttons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter any URL or text to generate...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
          Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: know,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(16.10), // You can adjust this value as needed
                  ),
                ),
                child: const Text(
                  'CHANGE COLOR + ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/colorswatch.png',
                ),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
} 
   