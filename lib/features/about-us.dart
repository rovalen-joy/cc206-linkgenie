import 'package:flutter/material.dart';

class About_Us extends StatelessWidget {
  const About_Us({Key? key}) : super(key: key);

  void know() {
    // Define what should happen when the button is pressed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
                'ABOUT US',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 254, 254),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
          ),
          backgroundColor: Color.fromARGB(255, 243, 108, 17),
        ),
        
        body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  width: 130,
                  height: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/link.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 270,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LinkGenie QR Code Generator boasts an array of user-friendly features, simplifying the process of generating QR codes and enhancing the overall user experience with its user-friendly interface. LinkGenie presents an impressive set of features designed to simplify QR code generation making it more accessible and efficient.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arimo',
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text( // This is for the Version Content
                  'VERSION 2.0',
                  style: TextStyle(fontSize: 17, fontFamily: 'Anton'),
                ),
                SizedBox(height: 10),
                Container(
                  width: 650,
                  height: 265,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 243, 108, 17),
                        offset: Offset(7.0, 7.0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What's New?",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Anton',
                              color: const Color.fromARGB(255, 240, 237, 237)),
                        ),
                        SizedBox(height: 30),
                        Text(
                          '   ✦  You can generate QR Codes for any data, including text, URLs, PDFs, images, or videos of your choice.',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Arimo',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '   ✦  You can automatically or manually select the colors for the generated QR code.',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Arimo',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '   ✦  You can customize the QR Code colors by clicking the menu icon in the top left.',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Arimo',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '   ✦  For your questions, the FAQs are also available in the menu.',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Arimo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 150),
                Container(
                  child: Center(
                    child: Text(
                      'Support and Feedback',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),
                ),
                Text(
                    'Do you have questions or need help? Reach out to us through: ',
                    style: TextStyle(fontWeight: FontWeight.w300, 
                    fontSize: 11),
                    ),
                Text(
                  'Email: supporttheshieldren@gmail.com',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w300,
                    fontSize: 11,),
                ),
                Text('Support Center: Linkgenie_theshieldren Help desk',
                  style: TextStyle(fontWeight: FontWeight.w300, 
                  fontSize: 11),
                  ),

                SizedBox(height: 80),
                Container(
                  child: Center(
                    child: Text(
                      'Copyright © 2023 by The Shieldren',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/shieldrencorp.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
