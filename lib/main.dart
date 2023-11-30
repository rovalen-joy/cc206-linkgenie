import 'package:cc206_linkgenie/components/home_drawer.dart';
import 'package:flutter/material.dart';
import 'features/input_and_color_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LinkGenie',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
          useMaterial3: true,
        ),
        home: Scaffold(
          drawer: const HomeDrawer(),
          body: const input_and_color_selection(),
        ));
  }
}
