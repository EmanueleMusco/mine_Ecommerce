// ignore_for_file: prefer_const_constructors

import 'pages/accesso.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

//installato plug in deice_preview ricordarsi di toglierlo

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      builder: (context) => App(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'mojiji',
          home: Accesso(),
          theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.white,
              textTheme:
                  GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
              visualDensity: VisualDensity.adaptivePlatformDensity),
          darkTheme: ThemeData(
            primaryColorDark: Colors.black,
            brightness: Brightness.dark,
            textTheme:
                GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          ),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
