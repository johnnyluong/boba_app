import 'package:boba_app/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:boba_app/constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'the boba app',
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenController(),
    );
  }
}
