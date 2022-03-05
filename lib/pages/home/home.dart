import 'package:flutter/material.dart';
import 'package:mojiji/services/auth.dart';
import 'package:sizer/sizer.dart';
import 'package:mojiji/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 70.w,
              height: 5.h,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0.sp),
                    ),
                  ),
                ),
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text(
                  'SignOut',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
