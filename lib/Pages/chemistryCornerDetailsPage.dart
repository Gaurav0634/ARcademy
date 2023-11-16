import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'appBar.dart';

class ChemistryLessons extends StatefulWidget {
  final String apptitle;
  final String title;
  final String description1;
  final String description2;
  final String description3;
  final String src;

  const ChemistryLessons({
    required this.apptitle,
    required this.title,
    required this.description1,
    required this.description2,
    required this.description3,

    required this.src,
    Key? key,
  }) : super(key: key);

  @override
  _ChemistryLessonsState createState() => _ChemistryLessonsState();
}

class _ChemistryLessonsState extends State<ChemistryLessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft), // Replace with your desired back icon
          onPressed: () {
            Navigator.pop(context); // You can customize the action on the back button
          },
        ),
        title: Text(
          widget.apptitle,
          style: TextStyle(
            fontFamily: "neue",
            color: Colors.white,
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

        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true, // Center the title
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(right: 2.0, left: 2.0),
            child: Column(
              children: [
                Container(
                  height: 300,
                  child: ModelViewer(
                    src: widget.src,
                    ar: true,
                    autoRotate: true,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "helveticamedium",
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  widget.description1,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "helveticamedium",
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  widget.description2,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "helveticamedium",
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  widget.description3,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "helveticamedium",
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChapterDetail1 extends StatelessWidget {
  const ChapterDetail1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(


        body:  ChemistryLessons(
          apptitle: "Millikan's Oil Drop Experiment",
          title: "Discovering the Charge of Electrons",
          src: "https://spacear.s3.ap-south-1.amazonaws.com/models/chemistry/oil.glb",
          description1: "Millikan's Oil Drop Experiment, conducted by American physicist Robert A. Millikan in the early 20th century, was a groundbreaking scientific investigation. This experiment helped us understand the fundamental nature of electric charge and the quantization of charge in tiny particles.",
          description2: "In the experiment, tiny oil droplets were suspended in a chamber and subjected to an electric field. By carefully measuring how the droplets moved under the influence of the electric field, Millikan was able to determine the charge of an individual electron. His precise measurements provided strong evidence for the discrete nature of electric charge, showing that electric charge comes in small, distinct units.",
          description3: "This experiment played a crucial role in the development of modern atomic and particle physics, as it contributed to our understanding of the structure of atoms and the existence of subatomic particles. Millikan's Oil Drop Experiment is a classic example of how careful experimentation can lead to groundbreaking discoveries in science.",

        )
    );
  }
}


class ChapterDetail2 extends StatelessWidget {
  const ChapterDetail2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

        body:  ChemistryLessons(
            apptitle: "Galvanic Cell",
            title: "Unraveling Chemical Energy Conversion",
            src: "https://spacear.s3.ap-south-1.amazonaws.com/models/chemistry/galvanic_cell.glb",
            description1: "A Galvanic Cell, also known as a Voltaic Cell, is a simple yet fascinating device that converts chemical energy into electrical energy. In this electrochemical system, two different metal electrodes are immersed in an electrolyte solution. The two electrodes are connected by a wire, allowing the flow of electrons from one electrode to the other.",
            description2: "During the operation of a galvanic cell, chemical reactions occur at the electrodes, leading to the release of electrons and the creation of an electric current. This process provides a practical way to harness electrical energy for various applications.",
            description3: "Galvanic cells have played a crucial role in our understanding of electrochemistry and have practical applications in batteries, which power many of our everyday devices. They are at the heart of the technology that keeps our flashlights, smartphones, and countless other devices running."
        )
    );
  }
}



class ChapterDetail3 extends StatelessWidget {
  const ChapterDetail3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

        body:  ChemistryLessons(
          apptitle: "Electroplating with Copper",
          title: "Enhancing Surfaces with Copper Electroplating",
          src: "https://spacear.s3.ap-south-1.amazonaws.com/models/chemistry/electroplating_with_copper.glb",
          description1: "Electroplating with copper is a widely used process that involves the deposition of a thin layer of copper onto the surface of another object. This electrochemical technique is employed to enhance the appearance, durability, and functionality of various items, from jewelry and decorative pieces to electrical connectors and printed circuit boards.",
          description2: "During the electroplating process, a copper electrode is immersed in a solution containing copper ions, and the object to be plated is connected to another electrode. When an electric current is applied, copper ions from the solution are reduced at the object's surface, forming a uniform and adherent layer of copper. This plating not only improves the object's aesthetic qualities but also provides protection against corrosion.",
          description3: "Electroplating with copper is essential in various industries, including manufacturing and electronics, and plays a key role in creating products that are both visually appealing and functionally reliable.",


        )
    );
  }
}



class ChapterDetail4 extends StatelessWidget {
  const ChapterDetail4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

        body:  ChemistryLessons(
          apptitle: "Dissociation of Water",
          title: "Enhancing Surfaces with Copper Electroplating",
          src: "https://spacear.s3.ap-south-1.amazonaws.com/models/chemistry/dissociation_of_water.glb",
          description1:"The Dissociation of Water is a fundamental chemical process that involves the separation of water molecules into their constituent ions. In this phenomenon, water, H2O, breaks down into hydrogen ions (H⁺) and hydroxide ions (OH⁻) through a self-ionization process.",
          description2: "The equilibrium reaction for water dissociation is H2O ⇌ H⁺ + OH⁻, where the double arrows indicate that this dissociation is a reversible process. This self-ionization of water is essential in various chemical reactions and is the foundation of the pH scale, which measures the acidity or alkalinity of solutions.",
          description3: "Understanding the dissociation of water is a cornerstone of chemistry, as it influences a wide range of chemical and biological processes. This simple yet critical concept helps us comprehend the behavior of solutions and the characteristics of acids and bases in the natural world.",
        )
    );
  }
}


