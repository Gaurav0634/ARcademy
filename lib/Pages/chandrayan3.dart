import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space_ar/Pages/appBar.dart';

class HorizontalImageSlider extends StatefulWidget {
  @override
  _HorizontalImageSliderState createState() => _HorizontalImageSliderState();
}

class _HorizontalImageSliderState extends State<HorizontalImageSlider> {
  final PageController controller = PageController(initialPage: 0, viewportFraction: 1.0);
  int currentPage = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startAutoPlay();
  }

  void startAutoPlay() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentPage < 3) {
        currentPage++;
        controller.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        currentPage = 0;
        controller.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        onPageChanged: (int page) {
          currentPage = page;
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/image${index + 1}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }
}

class chandra extends StatefulWidget {
  const chandra({super.key});

  @override
  State<chandra> createState() => _chandraState();
}

class _chandraState extends State<chandra> {
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
          "Chandrayan 3",
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
                    src: "https://spacear.s3.ap-south-1.amazonaws.com/models/models/vikram1.glb",
                    ar: true,
                    autoRotate: true,
                  ),
                ),
                Text(
                  "Chandrayaan-3 is on its journey to the moon.",
                  style: TextStyle(
                    color: Colors.white,
                      fontFamily: "helveticamedium",
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "Chandrayaan-3 centers on the Vikram Lander, a crucial component for ensuring a safe lunar landing and enabling rover exploration. Vikram, equipped with advanced navigation and hazard detection technologies, will work alongside the Rover to facilitate on-site chemical analysis and mobility on the moon's surface. The mission targets a safe lunar landing near 69.37°S, 32.34°E, with a mission life of approximately 14 Earth days. Vikram's scientific payloads will study lunar plasma density, thermal properties, moonquakes, and chemistry. Chandrayaan-3 showcases India's lunar exploration capabilities and enhances lunar science knowledge.",
                  style: TextStyle(
                    color: Colors.white,
                      fontFamily: "helveticamedium",
                    fontSize: 15

                  ),
                ),
                SizedBox(height: 10,),
                Text(
"Three dimensional views of Chandrayaan-3 modules are provided below:"     ,           style: TextStyle(
                      color: Colors.white,
                      fontFamily: "helveticamedium",
                      fontSize: 15

                  ),
                ),
                HorizontalImageSlider(),
                SizedBox(height: 10,),
                Text(
                  "Source www.isro.gov.in"     ,           style: TextStyle(
                    color: Colors.white,
                    fontFamily: "helveticaitalic",
                    fontSize: 15

                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


