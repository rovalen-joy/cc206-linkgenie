import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; //QR Flutter package for QR code generation
import 'package:cc206_linkgenie/features/generate_qrcode.dart';
import 'package:cc206_linkgenie/components/home_drawer.dart';
import 'dart:ui'; // Import for using describeEnum
import 'dart:io'; // Import for using Dart's File and IO related classes
import 'dart:typed_data'; // Import for working with byte data

//Enum represents the different types of inputs for QR code generation
enum InputType { text, url, pdf, image, video }

//Created a StatefulWidget for input and color selection in the QR code generator
class input_and_color_selection extends StatefulWidget {
  const input_and_color_selection({Key? key}) : super(key: key);
  @override
  _input_and_color_selectionState createState() =>
      _input_and_color_selectionState();
}

//State class for the input and color selection screen
class _input_and_color_selectionState extends State<input_and_color_selection> {
  TextEditingController _textController = TextEditingController();
  String data = '';
  InputType _selectedInputType = InputType.text;
  Color backgroundColor = Colors.white;
  Color foregroundColor = Colors.black;
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
        navigateToQRCodePage();
      }
    } else {
      // Handling file inputs (pdf, image, video)
      if (_selectedFile == null) {
        _showAlertDialog('You did not upload any file!');
      } else {
        navigateToQRCodePage();
      }
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

