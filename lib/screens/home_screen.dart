import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/widgets/project_screens.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ahmad Sultan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                  html.window.open('assets/resume/resume.pdf', 'Resume');
              },
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Theme.of(context).accentColor)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'Resume',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AboutScreen.routeName);
              },
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Theme.of(context).accentColor)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: ListView(
          children: [
            ProjectScreens(1, 'Timeplus (practice application)', [
              'assets/images/timeplus/1.png',
              'assets/images/timeplus/2.png',
              'assets/images/timeplus/3.png',
              'assets/images/timeplus/4.png',
              'assets/images/timeplus/5.png',
              'assets/images/timeplus/6.png',
              'assets/images/timeplus/7.png',
            ]),
            ProjectScreens(1, 'Sallaty Users App',
                ['assets/images/sallaty-users/home.png']),
          ],
        ),
      ),
    );
  }
}
