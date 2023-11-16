import 'package:flutter/material.dart';
import 'package:space_ar/Pages/appBar.dart';

class ChapterList extends StatelessWidget {
  final List<Map<String, String>> chapters = [
    {'title': "Chapter 1: Millikan's Oil Drop Experiment", 'description': "Investigating the charge of an electron using oil droplets."},
    {'title': "Chapter 2: Galvanic Cell", 'description': "Generating electricity through chemical reactions."},
    {'title': "Chapter 3:  Electroplating with Copper", 'description': "Coating objects with a layer of copper for protection."},
    {'title': "Chapter 4: Enantiomers of Bromochloroiodomethane", 'description': "Chirality and isomerism in a molecule with multiple halogens."},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: CustomAppBar1(title: "Chapter List", ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            final chapter = chapters[index];
            return ListTile(
              title: Text(chapter['title']!, style: TextStyle(
                fontFamily: "helvetivamedium", color: Colors.white, fontWeight: FontWeight.bold, fontSize:20
              ),),
              subtitle: Text(chapter['description']!, style: TextStyle(
                  fontFamily: "helvetivamedium", color: Colors.white
              ),),
              onTap: () {
                // Navigate to the chapter detail page based on the chapter number.
                Navigator.pushNamed(context, '/chapter${index+1}');
              },
            );
          },
        ),
      ),
    );
  }
}