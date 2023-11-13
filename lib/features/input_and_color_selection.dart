import 'package:flutter/material.dart';

class input_and_color_selection extends StatelessWidget {
  const input_and_color_selection({Key? key}) : super(key: key);

  void know() {
    // Define what should happen when the button is pressed
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width; //screen width for responsiveness

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20), // Spacing from the top for padding
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orangeAccent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text('URL'),
                ),
                SizedBox(width: 10), // Spacing between the URL and Text buttons
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orangeAccent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text('Text'),
                ),
              ],
            ),
            SizedBox(height: 10), // Spacing between the textfield and buttons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter any URL or text to generate...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 20), //for Spacing
            Container(
              width: 0.8 * screenWidth,
              child: Image.asset(
                'assets/colorswatch.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 20), //for Spacing
            Container(
              width: 0.8 * screenWidth,
              child: Image.asset(
                'assets/colorpicker.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 20), //for Spacing
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, //Center two 'Select Manually' buttons in the row
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: 0.15 *
                          screenWidth), //for spacing to the right of the first 'Select Manually' button
                  child: ElevatedButton(
                    onPressed: know,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0), //Padding
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
                      left: 0.15 *
                          screenWidth), //for spacing to the left of the second 'Select Manually' button
                  child: ElevatedButton(
                    onPressed: know,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0), //Padding
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
            SizedBox(height: 20), //for Spacing
          ],
        )),
      ),
    );
  }
}
