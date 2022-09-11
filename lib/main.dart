import 'package:flutter/material.dart';
import 'package:portfolio/screens/home_screen.dart';

import 'screens/about_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primaryColor: Color(0xFF0197d4),
        // backgroundColor: Color(0xFF2c3039),
        accentColor: Color(0xFF1a5d7a),
        primaryColorBrightness: Brightness.dark,
        accentColorBrightness: Brightness.dark,
        brightness: Brightness.dark,
        fontFamily: 'Gilroy',
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Color(0xFF0197d4),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Color(0xFF0197d4),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Color(0xFF0197d4),
            ),
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        AboutScreen.routeName: (ctx) => AboutScreen(),
      },
    );
  }
}
