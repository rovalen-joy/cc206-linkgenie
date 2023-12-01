import 'dart:typed_data'; //library for working with typed data
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io'; // library for working with files and the operating system
import 'package:qr_flutter/qr_flutter.dart'; //the QR Flutter package for QR code generation

class Generate_QR_Code extends StatefulWidget {
  final String data;
  final Color foregroundColor;
  final Color backgroundColor;
  // Constructor for Generate_QR_Code that takes 'data' as a required parameter
  const Generate_QR_Code({
    Key? key,
    required this.data,
    required this.foregroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override // Override createState method to create the state for Generate_QR_Code
  _Generate_QR_CodeState createState() => _Generate_QR_CodeState();
}

class _Generate_QR_CodeState extends State<Generate_QR_Code> {
  GlobalKey qrKey = GlobalKey(); // GlobalKey for capturing the QR code
  double _qrSize = 155.0; //initial size of the QR code

  void know() {
    // Define what should happen when the button is pressed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(39.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '   GENERATED \n      QR CODE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 70),
              RepaintBoundary(
                // Wrap the Container with a RepaintBoundary to capture its contents as an image
                key:
                    qrKey, // Assign a GlobalKey for capturing the RepaintBoundary
                child: Container(
                  width:
                      _qrSize, //dynamic width size depending on the value of slider the user selected
                  height:
                      _qrSize, //makes the height size depending on the value of slider the user selected
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(blurRadius: 5.0, offset: Offset(5.0, 5.0)),
                    ],
                  ),
                  child: FinalQrImageView(
                    // Display the QR code using the FinalQrImageView widget
                    data: widget.data, // Pass the QR code data to the widget
                    width: _qrSize,
                    height: _qrSize,
                    version: QrVersions.auto,
                    foregroundColor: widget.foregroundColor,
                    backgroundColor: widget.backgroundColor,
                  ),
                ),
              ),
              SizedBox(height: 50),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: know,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 235, 111, 9),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                  ),
                ),
                child: const Text(
                  'Generate Another QR Code',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 253, 253),
                    fontSize: 20,
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

class FinalQrImageView extends StatelessWidget {
  final String data;
  final Color foregroundColor;
  final Color backgroundColor;

  const FinalQrImageView({
    Key? key,
    required this.data,
    required int version,
    required double width,
    required double height,
    required this.foregroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: 400.0, //maximum value for QR Code image size
      padding: EdgeInsets.all(20),
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
    );
  }
}
