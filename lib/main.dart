import 'package:calculator/screens/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black38,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Calculator(),
            ),
          )),
    );
  }
}
