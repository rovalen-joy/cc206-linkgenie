import 'package:flutter/material.dart';

class Get_Started extends StatelessWidget {
  const Get_Started({Key? key}) : super(key: key);

  void know() {
    // Define what should happen when the button is pressed
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                '         LINKGENIE \nQR CODE GENERATOR',
                textScaleFactor: 2.5,
                style: TextStyle(color: const Color.fromARGB(255, 2, 2, 2), fontFamily: 'Roboto'),
              ),
              
              SizedBox(height: 100),
              ElevatedButton(
  onPressed: () {
    print('Input and Color Selection');
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Color.fromARGB(255, 243, 108, 17),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 25.0,
      ),
    ),
  ),
  child: const Text(
    'Get Started',
    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20, fontFamily: 'Roboto'),
  ),
),


              SizedBox(height: 100),
              Container(
                child: Center(
                  child: Text(
                    'Copyright © 2023 by The Shieldren',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}