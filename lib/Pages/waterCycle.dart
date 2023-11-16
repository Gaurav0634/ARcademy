import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space_ar/Pages/appBar.dart';

import 'encyclopedia.dart';
 
 class watercycle extends StatefulWidget {
   const watercycle({super.key});
 
   @override
   State<watercycle> createState() => _watercycleState();
 }
 
 class _watercycleState extends State<watercycle> {
   
   @override
   Widget build(BuildContext context) {

     
     return Scaffold(
         extendBodyBehindAppBar: true,
         appBar: AppBar(
           backgroundColor: Colors.transparent,
           leading: IconButton(
             icon: Icon(FontAwesomeIcons.arrowLeft), // Replace with your desired back icon
             onPressed: () {
               Navigator.pop(context); // You can customize the action on the back button
             },
           ),
           title: Text(
             "Water Cycle",
             style: TextStyle(
               fontFamily: "neue",
               color: Colors.black,
               fontWeight: FontWeight.bold,
             ),
           ),
           actions: [
             IconButton(
               icon: Icon(FontAwesomeIcons.barsStaggered),
               onPressed: () {
                 Scaffold.of(context).openDrawer();
               },
             ),
           ],

           iconTheme: IconThemeData(color: Colors.black),
           centerTitle: true, // Center the title
         ),
         drawer: AppDrawer(),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Container(
                 height: 300,

                 color: Color(0xFFEFFBFF),
                 child: ModelViewer(src: "https://spacear.s3.ap-south-1.amazonaws.com/models/watercycle1.glb",
                 ar: true, autoRotate: true,),
             ),
             Container(
               height: 900,
             decoration: BoxDecoration(
             image: const DecorationImage(
             image: AssetImage('assets/images/watercycle.png'),
     fit: BoxFit.cover,
     ) ),

              ),
           ],
         )

       ));
   }





 }
 