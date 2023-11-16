
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space_ar/Pages/appBar.dart';

class leftModel extends StatelessWidget {
  final String modelsrc;
  final String title;
  final String description;
  final String poster;

  leftModel({
    required this.modelsrc,
    required this.title,
    required this.description,
    required this.poster
});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              height: 200,
                width: 200,
                child: ModelViewer(
                  src: modelsrc,
                  poster: poster,
                  alt: 'A 3d Model',
                  ar: true,
                  autoRotate: true,
                ),
            )),
        SizedBox(width: 10,),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, style: TextStyle(
                  fontFamily: 'helveticamedium',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
                SizedBox(height: 10,),
                Text(
                  description, style: TextStyle(
                  fontFamily: 'helveticamedium',
                  fontSize: 15,

                    color: Colors.white

                ),
                ),
              ],
            ))

      ],
    );
  }
}


class rightModel extends StatelessWidget {
  final String modelsrc;
  final String title;
  final String description;
  final String poster;

  rightModel({
    required this.modelsrc,
    required this.title,
    required this.description,
    required this.poster
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, style: TextStyle(
                  fontFamily: 'helveticamedium',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
                SizedBox(height: 10,),
                Text(
                  description, style: TextStyle(
                  fontFamily: 'helveticamedium',
                  fontSize: 15,
                  color: Colors.white

                ),
                ),
              ],
            )),
        SizedBox(width: 10,),
        Expanded(
            flex: 1,
            child: Container(
              height: 200,
              width: 200,
              child: ModelViewer(
                src: modelsrc,
                poster: poster,
                alt: 'A 3d Model',
                ar: true,
                autoRotate: true,
              ),
            )),

      ],
    );
  }
}

class Animals extends StatefulWidget {
  const Animals({super.key});

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {

  @override

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar1(title: "The Age of Megafauna",),
      drawer: AppDrawer(),


      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
height: 1100,

          child: Column(
            children: [
              SizedBox(height: 100,),

              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Column(
                  children: [
                    rightModel(
                      modelsrc: "https://spacear.s3.ap-south-1.amazonaws.com/models/models/earth.glb",
                      poster: "",
                      title: "01. The birth of our planet",
                      description: "Once upon a time, Earth was born. Imagine a big ball of fire, cooling down to become our home. Slowly, tiny living things appeared in the oceans, like the first superheroes of Earth's story.",
                    ),
                    SizedBox(height: 20), // Add spacing between cards if needed
                    leftModel(
                      modelsrc: "assets/models/dna.glb",
                      poster: "",
                      title: "02. Life begins",
                      description: "From those tiny superheroes, life began to grow and change. It's like the ultimate adventure story. Single-celled heroes became multi-celled heroes.",
                    ),
                    SizedBox(height: 20), // Add spacing between cards if needed
                    rightModel(
                      modelsrc: "https://spacear.s3.ap-south-1.amazonaws.com/models/models/dinosaur.glb",
                      poster: "",
                      title: "03. Dinoaurs rule the earth",
                      description: "Millions of years later, the dinosaurs roared onto the scene. Some were as big as your school bus, and some were tiny like chickens. They were like the kings and queens of the ancient world, ruling the land.",
                    ),
                    SizedBox(height: 30,),
                    InkWell(
                      onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
    },

                      child: Container(

                        width: 220,
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child:  Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button click here
                              Navigator.of(context).pushReplacementNamed('/NextPage');
                            },


                            style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.all(Colors.transparent), // Set the background color to transparent
                              elevation: MaterialStateProperty.all(0), // Set the elevation to 0
                              side: MaterialStateProperty.all(BorderSide(color: Colors.white, width: 0.5)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17), // Adjust the radius as needed
                                ),
                              ),

                            ),
                            child: Text(
                              'NEXT PAGE ->',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'helveticamedium',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: CustomAppBar1(title: "The Age of Megafauna",),
      drawer: AppDrawer(),


      body: SingleChildScrollView(
        child: Container(
          height: 1100,
          color: Colors.black,


          child:
          Padding(
            padding: const EdgeInsets.only(right:8.0, left: 8.0, ),
            child: Column(
              children: [SizedBox(height: 100,),
                leftModel(modelsrc: 'https://spacear.s3.ap-south-1.amazonaws.com/models/models/mammoth.glb',poster: "", title: "04. The Cold and Furry Mammoths", description: "When the world turned icy, the woolly mammoths took the stage. They were like furry elephants with long, curvy tusks. These gentle giants thrived in the freezing cold."),
                SizedBox(height: 20),
                rightModel(modelsrc: "https://spacear.s3.ap-south-1.amazonaws.com/models/models/ptero.glb",poster: "", title: "05. Flying High with Pterodactyls", description: "Now, let's soar into the skies with the pterodactyls! These winged wonders ruled the air during the time of dinosaurs. They were like the superheroes of the prehistoric sky."),
                SizedBox(height: 20),
                leftModel(modelsrc: "https://spacear.s3.ap-south-1.amazonaws.com/models/models/tric.glb", poster: "", title: "06. Horned and Armored Giants", description: "Meet the triceratops, a dinosaur with three big horns and a frill on its head. They were like knights of the dinosaur world. And don't forget the megalodon, a giant shark that ruled the ancient seas. It was the ultimate ocean predator."),
                SizedBox(height: 40),

                 Text("Today, scientists are like detectives, solving Earth's mysteries. They dig up fossils and use cool technology to learn about our animal friends from the past. It's like solving a big puzzle that helps us understand our planet's story.", style: TextStyle(
                    fontFamily: "helveticamedium", fontSize: 1),
                 textAlign: TextAlign.center,),

              ],
            ),
          ),

        ),
      ),
    );
  }
}



