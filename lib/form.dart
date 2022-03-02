// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';
import 'package:sizer/sizer.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //form
          Padding(
            padding: EdgeInsets.only(left: 2.h, right: 2.h),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
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
            padding: EdgeInsets.only(left: 2.h, right: 2.h),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
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
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                      'Accesso in corso...',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    )),
                  );
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
                  fontSize: 30.sp,
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpForm()),
                );
              },
              child: Text(
                'Registrati',
                style: TextStyle(
                  fontSize: 30.sp,
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
