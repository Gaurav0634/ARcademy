import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:space_ar/Pages/appBar.dart';
import 'package:space_ar/Pages/chandrayan3.dart';
import 'package:space_ar/Pages/lunarGame.dart';
import 'package:space_ar/Pages/chemistryCorner.dart';
import 'package:space_ar/Pages/waterCycle.dart';
import 'package:video_player/video_player.dart';

import 'encyclopedia.dart';

class introVideo extends StatefulWidget {
  @override
  _introVideoState createState() => _introVideoState();
}

class _introVideoState extends State<introVideo> {
  late VideoPlayerController _controller;
  bool _showButton = false; // Variable to control button visibility

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/bigbang.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown
        setState(() {});
        // Start playing the video in a loop
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        _controller.play();
        // Trigger the button after a delay (adjust as needed)
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _showButton = true;
          });
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToHomePage() {
    // Navigate to the home page (replace 'HomePage' with the actual route name)
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery
        .of(context)
        .size
        .height;
    double devicewidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: CustomAppBar1(title: "ARcademy",),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceheight,
              child: Stack(
                children: [
                  Center(
                    child: _controller.value.isInitialized
                        ? SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                        : CircularProgressIndicator(), // Show a loading indicator
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 120.0, left: 10),
                      // Adjust the top padding as needed
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Long, long ago, there was nothing in the whole wide space, just darkness. But then, something amazing happened! BOOM! It was like the biggest, most colorful fireworks ever! This big boom was called the Big Bang. It made everything, the stars, planets, and even you and me. It was the start of our incredible space journey! ',
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'helveticamedium',
                              color: Colors.white,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    bottom: _showButton ? 120 : 120,
                    right: 65,
                    left: 65,
                    child: Container(

                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button click here
                            _navigateToHomePage();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors
                                .transparent),
                            elevation: MaterialStateProperty.all(0),
                            side: MaterialStateProperty.all(BorderSide(
                                color: Colors.white, width: 0.5)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    17), // Adjust the radius as needed
                              ),
                            ),
                          ),
                          child: Text(
                            'EXPLORE SPACE',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'helveticamedium',
                            ),
                          ),
                        )

                    ),
                  ),


                  Positioned(
                    // Add the FloatingActionButton at the right bottom corner
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(

                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      onPressed: () {
                        // Wrap the play or pause in a call to `setState`. This ensures the
                        // correct icon is shown.
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Add a horizontal scrollable list of images
            Container(
              width: devicewidth,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Latest AR Experiences",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "helveticamedium",
                        ),
                      ),
                    ),
                    SizedBox(height: 7,),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WebViewExample()),
                              );

                            },
                            child: Image.asset(
                              "assets/images/moonlander.png",
                              width: devicewidth - 5,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 15,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => chandra()));
                            },
                            child: Image.asset(
                              "assets/images/spaceday.png",
                              width: devicewidth - 5,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 15,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => Animals()));
                            },
                            child: Image.asset(
                              "assets/images/ency.png", width: devicewidth - 5,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(width: 15,),

                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => watercycle()));
                            },
                            child: Image.asset(
                              "assets/images/wc.png", width: devicewidth - 5,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, bottom: 8, top: 18),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Chemistry Corner",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "helveticamedium",
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ChapterList()));
                      },
                      child: Image.asset(
                        "assets/images/chemistry.png", width: devicewidth - 5,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}