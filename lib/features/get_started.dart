import 'package:flutter/material.dart';
import 'package:cc206_linkgenie/features/input_and_color_selection.dart';

class Get_Started extends StatelessWidget {
  const Get_Started({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
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
              'LINKGENIE',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 55,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'QR CODE GENERATOR',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => input_and_color_selection()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 243, 108, 17)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontFamily: 'Roboto'),
              ),
            ),
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  'Copyright © 2023 by The Shieldren Corp.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/shieldrencorp.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
