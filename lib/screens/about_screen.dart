import 'package:flutter/material.dart';
import 'dart:js' as js;

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About me :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: Text(
                'I am a 5th year Information Technology Engineering Student and a Hard-working programmer with a flair for creating elegant solutions in the least amount of time with many programming and developing skills.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Profiles :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(
                    'Github :',
                    style: (TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          js.context.callMethod(
                              'open', ['https://github.com/ahmadsultan39']);
                        },
                        child: Text('github.com/ahmadsultan39')),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(
                    'Linkedin :',
                    style: (TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          js.context.callMethod('open',
                              ['https://www.linkedin.com/in/ahmadsultan39/']);
                        },
                        child: Text('linkedin.com/in/ahmadsultan39')),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(
                    'Facebook :',
                    style: (TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          js.context.callMethod('open',
                              ['https://www.facebook.com/ahmad.sultan.796569']);
                        },
                        child: Text('facebook.com/ahmad.sultan.796569')),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(
                    'Twitter :',
                    style: (TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          js.context.callMethod(
                              'open', ['https://twitter.com/ahmadsultan39']);
                        },
                        child: Text('twitter.com/ahmadsultan39')),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(
                    'Instagram :',
                    style: (TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          js.context.callMethod('open',
                              ['https://www.instagram.com/ahmad_sultan2000/']);
                        },
                        child: Text('instagram.com/ahmad_sultan2000/')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
