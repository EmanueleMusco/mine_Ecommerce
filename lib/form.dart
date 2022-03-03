// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() {
    return _MyFormState();
  }
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //form
          Padding(
            padding: EdgeInsets.only(left: 4.h, right: 4.h),
            child: TextFormField(
              style: TextStyle(fontSize: 25.sp, color: Colors.white),
              controller: emailController,
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
              //validator per email
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
              style: TextStyle(fontSize: 25.sp, color: Colors.white),
              controller: passwordController,
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
              //validator password
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
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                        'Errore Firebase',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        ),
                      )),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                        'Loggato',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      )),
                    );
                  }
                  setState(() {});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                      'Riprova',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    )),
                  );
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
          SizedBox(height: 2.h),
          Text(
            'oppure',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 2.h),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpForm()),
                );
              },
              child: Text(
                'Registrati',
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
            height: 6.h,
            width: 70.w,
            child: Row(
              children: [
                Text(
                  'Puoi accedere con: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                // accesso con google
                InkWell(
                  onTap: () {},
                  splashColor: Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                  child: Ink.image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/google.png',
                    ),
                    height: 4.h,
                    width: 9.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
