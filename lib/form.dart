// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';

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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                fontSize: 30,
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
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
                fontSize: 30,
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
            height: 10,
          ),
          //altri metodi di accesso

          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text(
                'Accedi',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'oppure',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpForm()),
                );
              },
              child: const Text(
                'Registrati',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: 300,
            child: Row(
              children: [
                Text(
                  'Puoi accedere con: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
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
                    height: 30,
                    width: 30,
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
