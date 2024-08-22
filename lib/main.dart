import 'package:flutter/material.dart';
import 'package:sih/screens/home_page.dart';
import 'package:sih/screens/video_call_screen.dart';

import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor:  primary, // Primary color for the theme
        scaffoldBackgroundColor: Colors.white, // Background color for the app
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.white, // Light theme for AppBar
          elevation: 0,
          iconTheme: IconThemeData(color: primary),
          titleTextStyle: TextStyle(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(primary),
    trackColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
    return secondary;
    }
    return Colors.grey.shade400;
    })),
        floatingActionButtonTheme:  FloatingActionButtonThemeData(
          backgroundColor: primary,
        ),
      ),
      home: const HomePage(),
    );
  }
}

