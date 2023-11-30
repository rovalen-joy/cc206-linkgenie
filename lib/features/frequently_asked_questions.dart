import 'package:flutter/material.dart';

void main() => runApp(FrequentlyAskedQuestions());

class FrequentlyAskedQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FAQPage();
  }
}

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<bool> _isExpandedList = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'I’m new to LinkGenie QR Code Generator. What should I know? Glad you asked! Here’s a few basics to get you started.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                color: Colors.orange,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20.0),
            ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: EdgeInsets.all(0),
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _isExpandedList[panelIndex] = !isExpanded;
                });
              },
              children: [
                _buildExpansionPanel(
                    index: 0,
                    title: 'What is a QR Code?',
                    body:
                        'A QR Code, or Quick Response Code, is a two-dimensional barcode that can store various types of information, such as text, URLs, contact information, or other data.  It can be scanned using a QR Code reader or a smartphone camera.',
                    isExpanded: _isExpandedList[0],
                    color: Color.fromARGB(255, 252, 248, 247)),
                _buildExpansionPanel(
                    index: 1,
                    title: 'How does a LinkGenie QR Code Generator work?',
                    body:
                        'Absolutely, our LinkGenie QR Code Generator is entirely free of charge. Just enter your information, customize to the settings, and instantly generate your QR Code. It is a user-friendly tool designed to simplify the process of creating QR Codes for your convenience',
                    isExpanded: _isExpandedList[1],
                    color: Color.fromARGB(255, 250, 248, 248)),
                _buildExpansionPanel(
                    index: 2,
                    title:
                        'Is it free to use your LinkGenie QR Code Generator?',
                    body:
                        'LinkGenie QR Code Generator is a web app that allows you to create QR Codes by inputting the information you want to encode.  The generator then translates this data into a QR Code image, which you can download and use.',
                    isExpanded: _isExpandedList[2],
                    color: Color.fromARGB(255, 252, 248, 247)),
                _buildExpansionPanel(
                    index: 3,
                    title: 'Can I customize the appearance of the QR Code?',
                    body:
                        'Yes, our LinkGenie QR Code Generator allows you to customize the appearance of your QR Code.  You can choose automatically from different style and color options or you can manually select it from the color palette tool.',
                    isExpanded: _isExpandedList[3],
                    color: Color.fromARGB(255, 250, 248, 248)),
                _buildExpansionPanel(
                    index: 4,
                    title: 'How do I scan a QR Code?',
                    body:
                        'To scan a QR Code, you need a QR Code reader app on your smartphone. Most smartphones have built-in cameras that can scan QR Codes.  Open the QR Code reader app, point your camera at the QR Code, and the information will be displayed or the linked action will be performed.',
                    isExpanded: _isExpandedList[4],
                    color: Color.fromARGB(255, 252, 248, 247)),
                _buildExpansionPanel(
                    index: 5,
                    title:
                        'Can I edit or update a QR Code after it has been generated?',
                    body:
                        'Once a QR Code has been generated, its information remains unchangeable. To modify the content, a new QR Code must be generated with the updated data, ensuring the accuracy of the encoded information.',
                    isExpanded: _isExpandedList[5],
                    color: Color.fromARGB(255, 250, 248, 248)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ExpansionPanel _buildExpansionPanel({
    required int index,
    required String title,
    required String body,
    required bool isExpanded,
    required Color color,
  }) {
    return ExpansionPanel(
      backgroundColor: color,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _isExpandedList[index] = !_isExpandedList[index];
            });
          },
          child: Padding(
            // Styling for the Title of the ExpansionPanelList
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'Anton',
                fontSize: 15,
              ),
            ),
          ),
        );
      },
      body: Padding(
        //Styling for the Body of the ExpansionPanelList
        padding: const EdgeInsets.all(8.0),
        child: Text(
          body,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'Arimo',
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      isExpanded: _isExpandedList[index],
    );
  }
}
