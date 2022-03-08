// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mojiji/models/user_model.dart';
import 'package:mojiji/pages/authenticate/accesso.dart';
import 'package:mojiji/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:mojiji/services/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserClasses?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<UserClasses?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final UserClasses? user = snapshot.data;
            return user == null ? Accesso() : Home();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
