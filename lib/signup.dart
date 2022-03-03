import 'package:flutter/material.dart';
import 'package:mojiji/palette.dart';
import 'widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'form.dart';
import 'package:sizer/sizer.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() {
    return _SignUpFormState();
  }
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => MyForm()),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




/*
          SizedBox(
            width: 70.w,
            height: 5.h,
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
                if (user == null) {
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
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                      'Registrato',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    )),
                  );
                }
                setState(() {});
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpForm()),
                );*/
              },
*/
