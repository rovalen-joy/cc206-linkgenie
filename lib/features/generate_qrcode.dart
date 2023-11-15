import 'package:flutter/material.dart';

class Generate_QR_Code extends StatelessWidget {
  const Generate_QR_Code({Key? key}) : super(key: key);

  void know() {
    // Define what should happen when the button is pressed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'GENERATED QR CODE:',
              style: TextStyle(
                  color: Colors.black, fontSize: 40, fontFamily: 'Roboto'),
            ),
            SizedBox(height: 20), // Adjust the spacing as needed

            Container(
              width: 300.0,
              decoration: BoxDecoration(
                border: Border.all(width: 5),
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(blurRadius: 5.0, offset: Offset(5.0, 5.0)),
                ],
              ),
              child: Image.asset('assets/qr.png'),
            ),

            SizedBox(height: 50), // Adjust the spacing as needed

            ElevatedButton(
              onPressed: know,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 235, 111, 9)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0), // Padding
                ),
              ),
              child: const Text(
                'Download QR Code',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 253, 253), fontSize: 20),
              ),
            ),
            SizedBox(height: 20), // Add some spacing
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 235, 111, 9)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
              ),
              child: const Text(
                'Generate Another QR Code',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 253, 253), fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
