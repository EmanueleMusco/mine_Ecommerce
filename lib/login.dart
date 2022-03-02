// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// implementare firebase, plugin e dependancies gia messe

import 'package:flutter/material.dart';
import 'package:mojiji/palette.dart';
import 'widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'form.dart';
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
                  height: 2.h,
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
                          FlickerAnimatedText(
                            'Benvenuto!',
                            textStyle: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          FlickerAnimatedText(
                            'Accedi!',
                            textStyle: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.purpleAccent,
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
                MyForm(),
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