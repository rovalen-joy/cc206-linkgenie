import 'package:flutter/material.dart';
import 'dart:ui'; // Import for using describeEnum
import 'dart:io';// Import for using describeEnum
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:typed_data'; // Import for working with byte data
import 'package:file_picker/file_picker.dart'; // Import for picking files from the device storage
import 'package:cc206_linkgenie/components/home_drawer.dart';// Import for working with byte data

enum InputType { text, url, pdf, image, video }

//Created a StatfulWidget for input and color selection in the QR code generator
class input_and_color_selection extends StatefulWidget {
  const input_and_color_selection({Key? key}) : super(key: key);
  @override
  _input_and_color_selectionState createState() =>
      _input_and_color_selectionState();
}
void know() {
    // Define what should happen when the button is pressed
  }
//State class for the input and color selection screen
class _input_and_color_selectionState extends State<input_and_color_selection> {
  TextEditingController _textController = TextEditingController();
  String data = '';
  InputType _selectedInputType = InputType.text;
  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_handleTextInputChange);
  }

  //Method to handle changes in text input
  void _handleTextInputChange() {
    if (_selectedInputType == InputType.text ||
        _selectedInputType == InputType.url) {
      if (_isValidInput(_textController.text)) {
        setState(() {
          data = _textController.text;
        });
      } else {
        setState(
          () {
            data = '';
          },
        );
      }
    }
  }

  //Method to validate the input based on the selected input type
  bool _isValidInput(String input) {
    switch (_selectedInputType) {
      case InputType.text:
        // For text, check if input is a URL, return false if it is
        final urlPattern = RegExp(r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$');
        return !urlPattern.hasMatch(input) && input.isNotEmpty;
      case InputType.url:
        // Validate URL format
        final urlPattern = RegExp(r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$');
        return urlPattern.hasMatch(input);
      case InputType.pdf:
        // Validate if input ends with .pdf (basic validation)
        return input.toLowerCase().endsWith('.pdf');
      case InputType.image:
        // Validate if input ends with common image file extensions
        final imagePattern =
            RegExp(r'\.(jpeg|jpg|png|gif|bmp)$', caseSensitive: false);
        return imagePattern.hasMatch(input);
      case InputType.video:
        // Validate if input ends with common video file extensions
        final videoPattern =
            RegExp(r'\.(mp4|mov|wmv|flv|avi)$', caseSensitive: false);
        return videoPattern.hasMatch(input);
      default:
        return true;
    }
  }

  //Method to start the QR code generation process
  void generateQRCode() {
    if (_selectedInputType == InputType.text ||
        _selectedInputType == InputType.url) {
      if (_textController.text.isEmpty) {
        _showAlertDialog('You did not input anything!');
      } else if (!_isValidInput(_textController.text)) {
        _showAlertDialog('Invalid input for the selected type!');
      } else {
        setState(() {
          data = _textController.text;
        });
      }
    } else {
      // Handling file inputs (pdf, image, video)
      if (_selectedFile == null) {
        _showAlertDialog('You did not upload any file!');
      } else {
      }
    }
  }


//Method to show alert dialog in case of errors or invalid input
  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildInputTypeButton(InputType type) {
    final bool isSelected = _selectedInputType == type;
    IconData iconData;

    // Assigning different icons for each input type
    switch (type) {
      case InputType.text:
        iconData = Icons.text_fields;
        break;
      case InputType.url:
        iconData = Icons.link;
        break;
      case InputType.pdf:
        iconData = Icons.picture_as_pdf;
        break;
      case InputType.image:
        iconData = Icons.image;
        break;
      case InputType.video:
        iconData = Icons.videocam;
        break;
      default:
        iconData = Icons.device_unknown;
    };

    SizedBox(height: 20);

    return IconButton(
      // Input Data IconButton
      icon: Icon(
        iconData,
        size: 30, // Set the desired size here (you can adjust as needed)
        color: isSelected ? Colors.orange : Color.fromARGB(255, 156, 155, 155),
      ),
      onPressed: () {
        setState(() {
          _selectedInputType = type;
          _selectedFile = null;
        });
      },
    );
  }

  //Method to build the input widget based on selected input type
  Widget _buildInputWidget() {
    String labelText;

    switch (_selectedInputType) {
      case InputType.text:
        labelText = 'Enter any text to generate';
        break;
      case InputType.url:
        labelText = 'Enter any URL to generate';
        break;
      case InputType.pdf:
      case InputType.image:
      case InputType.video:
      return _buildFileUploadButton();
      default:
        return SizedBox();
    }

    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        labelText: labelText,
        //Adjust the height of text and URL button
        constraints: BoxConstraints(
          maxHeight: 79.0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      maxLength: 350, // Limiting the input to 350 characters
    );
  }

  //Method to build file upload button for file-based (pdf, image, video) input types
  Widget _buildFileUploadButton() {
    String buttonText;
    IconData iconData;

    switch (_selectedInputType) {
      case InputType.pdf:
        buttonText = 'Upload PDF';
        iconData = Icons.picture_as_pdf;
        break;
      case InputType.image:
        buttonText = 'Upload Image';
        iconData = Icons.image;
        break;
      case InputType.video:
        buttonText = 'Upload Video';
        iconData = Icons.videocam;
        break;
      default:
        return SizedBox();
    }

    return ElevatedButton.icon(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: _getFileExtensions(_selectedInputType),
        );

        if (result != null) {
          PlatformFile file = result.files.first;
          setState(() {
            _selectedFile = File(file.path!);
            String fileName = file.name ?? ''; // Extract file name being uploaded
            data = fileName; // i Set ang file name for generating the qr code
          });
        } else {
          print('User canceled file picking');
        }
      },
      icon: Icon(iconData),
      label: Text(buttonText),
    );
  }

  // Helper method to get allowed file extensions based on the selected input type
  List<String> _getFileExtensions(InputType type) {
    switch (type) {
      case InputType.pdf:
        return ['pdf'];
      case InputType.image:
        return ['jpg', 'jpeg', 'png', 'gif'];
      case InputType.video:
        return ['mp4', 'mov', 'avi'];
      default:
        return [];
    }
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
              width: 445,
              height: 135,
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select your Input Data:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: InputType.values
                        .map((type) => _buildInputTypeButton(type))
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildInputWidget(),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _textController.clear();
                            data = '';
                            _selectedFile = null;
                          });
                        },
                        // Clear button
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orangeAccent),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  width: 2.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'Clear',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 20),
                ]
              )
            ),
            if (data
                  .isNotEmpty) // Only show the QR code preview if the user entered text
                Container(
                  width: 200.0,
                  height: 230.0,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1.0),
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),

                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'QR Code Preview',
                          style: TextStyle(
                            color: Color.fromARGB(255, 146, 146, 146),
                            fontSize: 20,
                            fontFamily: 'Anton',
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: QrImageView(
                            data: data,
                            version: QrVersions.auto,
                            size: 150.0,
                            gapless: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                  SizedBox(height: 90),
                  ElevatedButton(
                    onPressed: know,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
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
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 0.15,
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
                          left: 80,
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
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                      ),
                    ),
                    child: const Text(
                      'Generate QR Code',
                      style: TextStyle(
                          color: Color.fromARGB(255, 253, 250, 250), fontSize: 25),
                    ),
                  ),

                  SizedBox(height: 90),
                ],
              ),
            ),
    ),
  );
}
}