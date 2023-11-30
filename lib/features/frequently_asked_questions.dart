import 'package:flutter/material.dart';

void main() => runApp(FrequentlyAskedQuestions());

class FrequentlyAskedQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FAQPage();
  }
}

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor =
    Color.fromARGB(255, 255, 102, 0); // Set the primary colors

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FAQs',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 254, 254),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 243, 108, 17),
      ),
      
      
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'I’m new to LinkGenie QR Code Generator. What should I know? Glad you asked! Here’s a few basics to get you started.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.orange,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 20.0),
                // FAQ Tiles...
                ExpansionTile(
                  title: Text(
                    'What is a QR Code?',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ), // Text color
                  ),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'A QR Code, or Quick Response Code, is a two-dimensional barcode that can store various types of information, such as text, URLs, contact information, or other data. It can be scanned using a QR Code reader or a smartphone camera.',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 6, 6, 6),
                          fontFamily: 'Roboto',
                        ), // Text color
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'How does a LinkGenie QR Code Generator work?',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Yes, our LinkGenie QR Code Generator is completely free to use. Simply input your data, customize the settings if needed, and generate your QR Code instantly.',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 11, 11, 11),
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Is it free to use your LinkGenie QR Code Generator?',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 11, 11, 11),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            'LinkGenie QR Code Generator is a mobile app that allows you to create QR Codes by inputting the information you want to encode.',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 9, 9, 9),
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'The generator then translates this data into a QR Code image, which you can download and use.',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 5, 5, 5),
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Can I customize the appearance of the QR Code?',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Yes, our LinkGenie QR Code Generator allows you to customize the appearance of your QR Code. You can choose automatically from different style and color options or you can manually select it from the color palette tool.',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 11, 11, 11),
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'How do I scan a QR Code?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 11, 11, 11),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            'To scan a QR Code, you need a QR Code reader app on your smartphone. Most smartphones have built-in cameras that can scan QR Codes.',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 9, 9, 9),
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Open the QR Code reader app, point your camera at the QR Code, and the information will be displayed or the linked action will be performed.',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 5, 5, 5),
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Can I edit or update a QR Code after it has been generated?',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Once a QR Code is generated, its content is fixed. If you need to update the information, you will need to generate a new QR Code with the updated data.',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 11, 11, 11),
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
