// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mojiji/services/auth_service.dart';
import 'package:provider/provider.dart';
import '../authenticate/signup.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogIn createState() {
    return _LogIn();
  }
}

class _LogIn extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          //form
          Padding(
            padding: EdgeInsets.only(left: 4.h, right: 4.h),
            child: TextFormField(
              controller: emailController,
              style: TextStyle(fontSize: 25.sp, color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.sp)),
                prefixIcon: Icon(Icons.email_rounded),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "L'email non può essere vuota";
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.h, right: 4.h),
            child: TextFormField(
              controller: passwordController,
              style: TextStyle(fontSize: 25.sp, color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.sp)),
                prefixIcon: Icon(Icons.key),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La password non può essere vuota';
                } else if (value.length < 8) {
                  return 'La password deve contenere almeno 8 caratteri';
                }
                return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(15.sp),
                child: Text(
                  'you forgor?',
                  style:
                      TextStyle(color: Colors.lightBlueAccent, fontSize: 15.sp),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          //altri metodi di accesso

          SizedBox(
            height: 2.h,
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
                if (_formKey.currentState!.validate()) {
                  await authService.signInWithEmailAndPassword(
                      emailController.text, passwordController.text);
                }
              },
              child: Text(
                'Accedi',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),

          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Non sei registrato?',
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20.sp),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpForm()),
                    );
                  },
                  child: Text(
                    ' clicca qui',
                    style: TextStyle(
                        color: Colors.lightBlueAccent, fontSize: 15.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Column(
            children: [
              Text(
                'Puoi anche accedere con: ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              // accesso con google
              InkWell(
                onTap: () {},
                splashColor: Colors.white10,
                borderRadius: BorderRadius.circular(20.sp),
                child: Ink.image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/google.png',
                  ),
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
