// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mojiji/services/auth_service.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() {
    return _SignUpFormState();
  }
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confPass = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  //NOME
                  Padding(
                    padding: EdgeInsets.only(left: 4.h, right: 4.h),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp)),
                        prefixIcon: Icon(Icons.person_rounded),
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Il nome non può essere vuoto";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  //COGNOME
                  Padding(
                    padding: EdgeInsets.only(left: 4.h, right: 4.h),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp)),
                        prefixIcon: Icon(Icons.person_rounded),
                        labelText: 'Cognome',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Il cognome non può essere vuoto";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  //EMAIL
                  Padding(
                    padding: EdgeInsets.only(left: 4.h, right: 4.h),
                    child: TextFormField(
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp)),
                        prefixIcon: Icon(Icons.email_rounded),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Il nome non può essere vuoto";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  //PASSWORD
                  Padding(
                    padding: EdgeInsets.only(left: 4.h, right: 4.h),
                    child: TextFormField(
                      controller: passwordController,
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp)),
                        prefixIcon: Icon(Icons.key),
                        labelText: 'Password',
                        labelStyle: TextStyle(
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
                  SizedBox(
                    height: 3.h,
                  ),
                  //CONFERMA PASSWORD
                  Padding(
                    padding: EdgeInsets.only(left: 4.h, right: 4.h),
                    child: TextFormField(
                      controller: confPass,
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.sp)),
                        prefixIcon: Icon(Icons.key),
                        labelText: 'Conferma Password',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'La password non può essere vuota';
                        } else if (value.length < 8) {
                          return 'La password deve contenere almeno 8 caratteri';
                        } else if (passwordController.text != confPass.text) {
                          return 'La password deve corrispondere';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    height: 5.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0.sp),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authService.createUserWithEmailAndPassword(
                              emailController.text, passwordController.text);
                        }
                      },
                      child: Text(
                        'Registrati',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
