import 'login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';

//installato plug in deice_preview ricordarsi di toglierlo

void main() => runApp(
      DevicePreview(
        builder: (context) => App(), // Wrap your app
      ),
    );

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
              primarySwatch: Colors.purple,
              textTheme:
                  GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
              scaffoldBackgroundColor: const Color(0xffe7d7ff),
              visualDensity: VisualDensity.adaptivePlatformDensity),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

/* 
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
*/