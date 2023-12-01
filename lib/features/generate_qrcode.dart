import 'dart:async'; // library for handling asynchronous operations
import 'dart:typed_data'; //library for working with typed data
import 'dart:ui' as ui;
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

              //Adding a slider to adjust or resize the generated QR Code image
              SizedBox(
                height: 20.0,
              ),

              Slider(
                  inactiveColor: Colors.orange,
                  value: _qrSize,
                  min: 100,
                  max: 300,
                  divisions: 200,
                  label: '$_qrSize.', //display the current value
                  onChanged: (value) {
                    setState(() {
                      _qrSize = value;
                    });
                  }),

              Text(
                'QR Code Size: ${_qrSize.round()}',
                style: TextStyle(
                    color: ui.Color.fromARGB(255, 11, 11, 11),
                    fontSize: 20,
                    fontFamily: 'Arimo'),
              ),

              SizedBox(height: 40),

              // Button for Downloading the Generated QR Code
              ElevatedButton(
                onPressed: () async {
                  await _captureAndSavePng(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 253, 250, 246)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Download QR Code',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 235, 111, 9),
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.download,
                      size: 20.0,
                      color: Color.fromARGB(255, 235, 111, 9),
                    ),
                  ],
                ),
              ),

              // Generating Another QR Code
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 235, 111, 9),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
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
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Downloading and Saving the Generated QR Code
  Future<void> _captureAndSavePng(BuildContext context) async {
    // Asynchronous function to capture and save the QR code as a PNG image
    try {
      // Try to find the RenderRepaintBoundary associated with the qrKey
      RenderRepaintBoundary boundary =
          qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(
          pixelRatio:
              3.0); // Convert the boundary to an image with a pixel ratio of 3.0
      ByteData? byteData = // Convert the image to bytes in PNG format
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      String fileName =
          'LinkGenie-QR-Code'; // Define a base file name for the saved QR code
      int i = 1;
      final externalDir =
          '/storage/emulated/0/Download'; // Define the directory path for saving the QR code image
      while (await File('$externalDir/$fileName.png').exists()) {
        fileName = 'linkgenie$i';
        i++;
      }

      if (!await Directory(externalDir).exists()) {
        // Check if the external directory exists, and create it if not
        await Directory(externalDir).create(recursive: true);
      }

      final file = await File('$externalDir/$fileName.png')
          .create(); // Create the file and write the PNG bytes to it
      await file.writeAsBytes(pngBytes);

      const snackBar = SnackBar(
          content: Text(
              'Successfully save the QR Code to the Gallery!')); // Display a snackbar notifying the user that the QR code has been saved
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      // If an error occurs, display a snackbar with an error message
      const snackBar =
          SnackBar(content: Text('Warning: Unable to save the QR Code'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
