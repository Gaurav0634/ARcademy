import 'package:flutter/material.dart';

import 'package:space_ar/Pages/chandrayan3.dart';
import 'package:space_ar/Pages/chemistryCornerDetailsPage.dart';
import 'package:space_ar/Pages/lunarGame.dart';
import 'package:space_ar/Pages/solarSystemPage.dart';
import 'package:space_ar/Pages/introVideo.dart';
import 'package:space_ar/Pages/waterCycle.dart';


import 'Pages/chemistryCorner.dart';
import 'Pages/chemistryCorner.dart';
import 'Pages/encyclopedia.dart';

import 'Pages/splashScreen.dart';

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
        '/home': (context) =>Homepage1(),
        '/Animals': (context) =>Animals(),
        '/watercycle': (context) =>watercycle(),
        '/NextPage': (context) =>NextPage(),
         '/chandra': (context) =>chandra(),
         '/moonlander': (context) =>WebViewExample(),
         '/chapterlist': (context) =>ChapterList(),


        '/chapter1': (context) => ChapterDetail1(),
        '/chapter2': (context) => ChapterDetail2(),
        '/chapter3': (context) => ChapterDetail3(),
        '/chapter4': (context) => ChapterDetail4(),


      }
    );
  }
}
