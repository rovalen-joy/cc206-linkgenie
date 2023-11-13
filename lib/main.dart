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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
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
              style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
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
