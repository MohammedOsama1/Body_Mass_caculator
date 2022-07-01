import 'package:flutter/material.dart';
import 'layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.black,
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
            bodyText2: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45),
            bodyText1: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26)),
      ),
      home: const Layout(),
    );
  }
}
