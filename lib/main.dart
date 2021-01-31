import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frequency/Widget/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurple[200],
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
                fontFamily: 'Dosis',
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Dosis',
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      home: BottomNavigation(),
    );
  }
}
