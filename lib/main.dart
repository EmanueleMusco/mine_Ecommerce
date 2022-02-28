import 'login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mojiji',
      home: Accesso(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: const Color(0xffe7d7ff),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
    );
  }
}
