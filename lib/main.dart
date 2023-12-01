import 'package:cc206_linkgenie/components/home_drawer.dart';
import 'package:cc206_linkgenie/features/get_started.dart';
import 'package:flutter/material.dart';
import 'features/input_and_color_selection.dart';
import 'features/generate_qrcode.dart';
import 'features/frequently_asked_questions.dart';
import 'features/about-us.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove the debug banner
      title: 'LinkGenie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      initialRoute: '/get-started',
      routes: {
        '/get-started': (context) => const Get_Started(),
        '/': (context) => const MyHomePage(),
        '/about-us': (context) => About_Us(),
        '/faq': (context) => FrequentlyAskedQuestions(),
        '/input-color': (context) => input_and_color_selection(),
        '/generate-qrcode': (context) => Generate_QR_Code(
              data: '',
              foregroundColor: Colors.black, // Default color
              backgroundColor: Colors.white, // Default color
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
    );
  }
}
