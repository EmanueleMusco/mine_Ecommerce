import 'package:flutter/material.dart';
import 'package:mojiji/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:mojiji/services/auth_service.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
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
                  await authService.signOut();
                },
                child: Text(
                  'Sign Out',
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
