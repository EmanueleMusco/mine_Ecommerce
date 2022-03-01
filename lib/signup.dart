import 'package:flutter/material.dart';
import 'package:mojiji/palette.dart';
import 'widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'form.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
