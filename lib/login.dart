// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mojiji/palette.dart';
import 'widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Accesso extends StatelessWidget {
  const Accesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'MOJIJI',
                      style: kHeading,
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 50,
                  child: Stack(
                    children: [
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FlickerAnimatedText(
                            'Benvenuto!',
                            textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          FlickerAnimatedText(
                            'Accedi!',
                            textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  'email',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


/*
Text(
'Benvenuto!',
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.normal,
 color: Colors.white,
),
), */