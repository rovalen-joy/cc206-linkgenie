import 'package:cc206_linkgenie/features/frequently_asked_questions.dart';
import 'package:flutter/material.dart';
import 'features/input_and_color_selection.dart';
import 'components/home_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'FAQPage',
      theme: ThemeData(
        //
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FAQPage(),
    );
    return materialApp;
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LINKGENIE',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                SizedBox(width: 8),
                Image.asset(
                  'assets/logo.png',
                  height: 30,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.deepOrangeAccent,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.app_registration_outlined),
                text: 'Input and Color Selection',
              ),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        drawer: const HomeDrawer(),
        body: const TabBarView(
          children: [
            input_and_color_selection(),
          ],
        ),
      ),
    );
  }
}
