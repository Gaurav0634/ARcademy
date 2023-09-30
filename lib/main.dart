import 'package:flutter/material.dart';
import 'package:space_ar/Pages/introVideo.dart';

import 'Pages/homePage.dart';
import 'Pages/splashScreen.dart';
import 'ar_earth_map_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      routes: {
        '/': (context) => splashScreen(),
        '/introVideo': (context) => introVideo(),
        '/home': (context) => HomePage(),

      }
    );
  }
}
