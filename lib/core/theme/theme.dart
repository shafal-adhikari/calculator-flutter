import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.red,
    fontFamily: 'Poppins Bold',
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(
        color: const Color.fromARGB(255, 17, 163, 165),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
  );
}
