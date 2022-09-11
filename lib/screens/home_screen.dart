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
        backgroundColor: Theme.of(context).primaryColor,
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
            ProjectScreens(1, 'Baitouti App', [
              'assets/images/baitouti-students/home2.jpg',
              'assets/images/baitouti-students/meal.jpg',
              'assets/images/baitouti-students/search.jpg',
              'assets/images/baitouti-students/search2.jpg',
              'assets/images/baitouti-students/subscription.jpg',
              'assets/images/baitouti-chefs/orders.jpg',
              'assets/images/baitouti-chefs/order_details.jpg',
              'assets/images/baitouti-chefs/menu.jpg',
              'assets/images/baitouti-chefs/menu_edit.jpg',
              'assets/images/baitouti-students/cart.jpg',
              'assets/images/baitouti-students/chef.jpg',
            ]),
            ProjectScreens(2, 'Sallaty Users App', [
              'assets/images/sallaty-users/1.jpg',
              'assets/images/sallaty-users/2.jpg',
              'assets/images/sallaty-users/3.jpg',
              'assets/images/sallaty-users/4.jpg',
              'assets/images/sallaty-users/5.jpg',
              'assets/images/sallaty-users/6.jpg',
              'assets/images/sallaty-users/7.png',
              'assets/images/sallaty-users/8.jpg',
              'assets/images/sallaty-users/9.jpg',
              'assets/images/sallaty-users/10.png',
              'assets/images/sallaty-users/11.png',
              'assets/images/sallaty-users/12.png',
              'assets/images/sallaty-users/13.png',
              'assets/images/sallaty-users/14.jpg',
              'assets/images/sallaty-users/15.jpg',
            ]),
            ProjectScreens(3, 'Timeplus (practice application)', [
              'assets/images/timeplus/1.png',
              'assets/images/timeplus/2.png',
              'assets/images/timeplus/3.png',
              'assets/images/timeplus/4.png',
              'assets/images/timeplus/5.png',
              'assets/images/timeplus/6.png',
              'assets/images/timeplus/7.png',
            ]),
          ],
        ),
      ),
    );
  }
}
