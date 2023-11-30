import 'package:cc206_linkgenie/features/about_us.dart';
import 'package:flutter/material.dart';
import 'components/home_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ABOUT US',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
          useMaterial3: true,
        ),
        home: Scaffold(
          drawer: const HomeDrawer(),
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
          body: const About_Us(),
        ));
  }
}