// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mojiji/pages/palette.dart';
import '../widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../pages/authenticate/login.dart';
import 'package:sizer/sizer.dart';

class Accesso extends StatelessWidget {
  const Accesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
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
                  height: 9.h,
                ),
                SizedBox(
                  height: 10.h,
                  child: Stack(
                    children: [
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Benvenuto!',
                            textStyle: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          FadeAnimatedText(
                            'Accedi!',
                            textStyle: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                LogIn(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
