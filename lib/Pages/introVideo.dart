

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    _controller = VideoPlayerController.asset('assets/videos/intro.mp4')
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
    return Scaffold(
      body: Stack(
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
              padding: const EdgeInsets.only(top: 50.0, left: 10), // Adjust the top padding as needed
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    '20:23 urgent message from Mission Control: Explore the Universe with AR!',
                    textStyle: const TextStyle(
                      fontSize: 25.0,

                      fontFamily: 'basis',
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
              ),
            ),
          ),



          AnimatedPositioned(
            duration: Duration(milliseconds: 100), // Animation duration
            curve: Curves.easeInOut, // Animation curve
            bottom: _showButton ? 120 : 120, // Initial position off the screen
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                // Handle button click here
                _navigateToHomePage();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent, // Set the background color to transparent
                elevation: 0, // Remove the button's elevation
              ),
              child: Text(
                'EXPLORE SPACE ->',
                style: TextStyle(
                    fontSize: 30,
                  fontFamily: 'basis',
                ),
              ),
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
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

