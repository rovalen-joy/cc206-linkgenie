import 'package:flutter/material.dart';

class input_and_color_selection extends StatelessWidget {
  const input_and_color_selection({Key? key}) : super(key: key);

  void know() {
    // Define what should happen when the button is pressed
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter any URL or Text to generate',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
              TextButton(
                onPressed: know,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 252, 247, 242)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
                child: Text(
                  'QR Code Preview',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300.0,
                child: Container(
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
              ),
              SizedBox(height: 90),
              ElevatedButton(
                onPressed: know,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(16.10), // Padding
                  ),
                ),
                child: const Text(
                  'CHANGE COLOR + ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 0.6 * screenWidth,
                child: Image.asset(
                  'assets/colorswatch.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 0.6 * screenWidth,
                child: Image.asset(
                  'assets/colorpicker.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 0.15 * screenWidth,
                    ),
                    child: ElevatedButton(
                      onPressed: know,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 241, 184, 98)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Select Manually',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 0.01 * screenWidth,
                    ),
                    child: ElevatedButton(
                      onPressed: know,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 241, 184, 98)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Select Manually',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/generate-qrcode');
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
                    EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                  ),
                ),
                child: const Text(
                  'Generate QR Code',
                  style: TextStyle(
                      color: Color.fromARGB(255, 253, 250, 250), fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
