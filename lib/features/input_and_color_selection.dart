import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; //Import for implementing color picker widget
import 'package:qr_flutter/qr_flutter.dart'; //QR Flutter package for QR code generation
import 'package:cc206_linkgenie/features/generate_qrcode.dart';
import 'package:cc206_linkgenie/components/home_drawer.dart';
import 'dart:ui'; // Import for using describeEnum
import 'package:file_picker/file_picker.dart'; // Import for picking files from the device storage
import 'dart:io'; // Import for using Dart's File and IO related classes
import 'dart:typed_data'; // Import for working with byte data

//Enum repsents the different types of inputs for QR code generation
enum InputType { text, url, pdf, image, video }

//Created a StatfulWidget for input and color selection in the QR code generator
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

//Method to navigate to the QR code generation page
  void navigateToQRCodePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Generate_QR_Code(
          data: data,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
      ),
    );
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

  // Method to show the color picker dialog
  void showColorPicker(Color currentColor, Function(Color) onColorChanged) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: onColorChanged,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Method to update the background color
  void updateBackgroundColor(Color color) {
    setState(() => backgroundColor = color);
  }

  // Method to update the foreground color
  void updateForegroundColor(Color color) {
    setState(() => foregroundColor = color);
  }

  // Predefined color pairs for quick selection
  List<Map<String, Color>> colorPairs = [
    {'background': Colors.black, 'foreground': Colors.white},
    {
      'background': Color.fromRGBO(30, 49, 49, 1),
      'foreground': Color.fromRGBO(167, 201, 167, 1)
    },
    {
      'background': Color.fromRGBO(223, 218, 154, 1),
      'foreground': Color.fromRGBO(0, 51, 0, 1)
    },
    {
      'background': Color.fromRGBO(178, 34, 34, 1),
      'foreground': Color.fromRGBO(19, 18, 18, 1)
    },
    {
      'background': Color.fromRGBO(45, 30, 54, 1),
      'foreground': Color.fromRGBO(233, 169, 160, 1),
    },
    {
      'background': Color.fromRGBO(18, 99, 204, 1),
      'foreground': Color.fromRGBO(255, 250, 205, 1)
    }
  ];

  //State variable for currently selected color pair
  Map<String, Color>? currentColorPair;

  //Method to build buttons for selecting input type
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
    }
    ;
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
            _selectedFile = File(file.name);
            data = _selectedFile!
                .path; // Set the file path to data for QR code generation
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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LINKGENIE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(width: 8),
              Image.asset(
                'assets/logo.png',
                height: 40,
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 243, 108, 17),
      ),
      drawer: const HomeDrawer(),
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orangeAccent),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
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
                  ],
                ),
              ),

              //QR Code Preview button

              if (data
                  .isNotEmpty) // Only show the QR code preview if the user entered valid data
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
                            foregroundColor: foregroundColor,
                            backgroundColor: backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              SizedBox(height: 40),

              // Color swatch integration
              Container(
                width: 300,
                height: 290,
                padding:
                    EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF7EA),
                  border: Border.all(
                    color: Color(0xFFE96D00),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color Swatch',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: 'Anton',
                      ),
                    ),
                    Text(
                      'Select your QR Code background and foreground colors automatically.', // Subtitle text
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: Center(
                        child: Column(
                          children: List.generate(
                            (colorPairs.length / 2)
                                .ceil(), // Calculate the number of rows needed
                            (rowIndex) {
                              final start = rowIndex * 2;
                              final end = (rowIndex + 1) * 2;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: colorPairs
                                    .sublist(start, end)
                                    .map((pair) => Container(
                                          padding: EdgeInsets.all(10),
                                          child: ColorSwatchPair(
                                            bgColor: pair['background']!,
                                            fgColor: pair['foreground']!,
                                            onSelect: () {
                                              setState(() {
                                                currentColorPair = pair;
                                                backgroundColor =
                                                    pair['background']!;
                                                foregroundColor =
                                                    pair['foreground']!;
                                              });
                                            },
                                          ),
                                        ))
                                    .toList(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Colorpicker integration
              Container(
                width: 300,
                height: 360,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7EA),
                  border: Border.all(
                    color: const Color(0xFFE96D00),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Text(
                        "Color Picker",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Anton',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Select your QR Code background and foreground colors manually.',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Color Picker buttons
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Select Background Color button
                          Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  border: Border.all(
                                    color:
                                        backgroundColor.computeLuminance() > 0.5
                                            ? Colors.black
                                            : Colors.white,
                                    width: 1,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => showColorPicker(
                                  backgroundColor,
                                  updateBackgroundColor,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 235, 148, 35),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                  ),
                                ),
                                child: const Text(
                                  'Select Background Color',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25), //Select Foreground Color button
                          Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: foregroundColor,
                                  border: Border.all(
                                    color:
                                        foregroundColor.computeLuminance() > 0.5
                                            ? Colors.black
                                            : Colors.white,
                                    width: 1,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => showColorPicker(
                                  foregroundColor,
                                  updateForegroundColor,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 235, 148, 35),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                  ),
                                ),
                                child: const Text('Select Foreground Color',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              //Generate QR Code button
              ElevatedButton(
                onPressed: () {
                  // Checking for text or URL input types
                  if (_selectedInputType == InputType.text ||
                      _selectedInputType == InputType.url) {
                    if (_textController.text.isEmpty) {
                      _showAlertDialog('You did not input anything!');
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Generate_QR_Code(
                            data: _textController
                                .text, // Pass the text or URL as data
                            foregroundColor: foregroundColor,
                            backgroundColor: backgroundColor,
                          ),
                        ),
                      );
                    }
                  } else {
                    // For file inputs (PDF, Image, Video)
                    if (data.isEmpty) {
                      _showAlertDialog('You did not upload any file!');
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Generate_QR_Code(
                            data:
                                data, // Pass the file data as generated from file upload
                            foregroundColor: foregroundColor,
                            backgroundColor: backgroundColor,
                          ),
                        ),
                      );
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 235, 111, 9)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                  ),
                ),
                child: const Text(
                  'Generate QR Code',
                  style: TextStyle(
                      color: Color.fromARGB(255, 253, 250, 250), fontSize: 18),
                ),
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper method to convert enum value to string
String enumToString(Object enumValue) {
  return enumValue.toString().split('.').last;
}

//// StatefulWidget representing a color swatch pair
class ColorSwatchPair extends StatefulWidget {
  final Color bgColor;
  final Color fgColor;
  final VoidCallback onSelect;

  const ColorSwatchPair({
    Key? key,
    required this.bgColor,
    required this.fgColor,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ColorSwatchPairState createState() => _ColorSwatchPairState();
}

//// State class for ColorSwatchPair
class _ColorSwatchPairState extends State<ColorSwatchPair> {
  bool isHovering = false;

//Method to create an interactive  UI that responds to mouse hover.
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: widget.onSelect,
        child: Transform.scale(
          scale: isHovering ? 1.1 : 1.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorContainer(widget.bgColor),
              buildColorContainer(widget.fgColor),
            ],
          ),
        ),
      ),
    );
  }

//Method to designed to create a Container widget based on the passed color parameter
  Widget buildColorContainer(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: isHovering ? Colors.orange : Colors.black,
          width: isHovering ? 3 : 1,
        ),
      ),
    );
  }
}
