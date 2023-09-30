import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart' as FlutterMaterial; // Alias for Flutter's Colors

class Earth extends StatefulWidget {
  const Earth({Key? key}) : super(key: key);

  @override
  State<Earth> createState() => _EarthState();
}

class _EarthState extends State<Earth> with SingleTickerProviderStateMixin {
  ArCoreController? augmentedRealityCoreController;
  bool animationStarted = false;
  late AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // You can adjust the duration as needed
    )..repeat();
  }

  void augmentedRealityViewCreated(ArCoreController coreController) {
    augmentedRealityCoreController = coreController;
    displayEarthMapSphere(augmentedRealityCoreController!);
  }

  Future<void> displayEarthMapSphere(ArCoreController coreController) async {
    final ByteData earthTextureBytes = await rootBundle.load('assets/images/earth_map.jpg');
    final material = ArCoreMaterial(
      color: FlutterMaterial.Colors.blue, // Specify Colors from FlutterMaterial package
      textureBytes: earthTextureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.5,
    );

    final rotatingNode = ArCoreRotatingNode(
      shape: sphere,
      position: Vector3(0, 0, -1.5),
      rotation: Vector4(0, 1, 0, rotationController.value * 360.0), // Rotate around the Y-axis
    );

    augmentedRealityCoreController!.addArCoreNode(rotatingNode);
  }

  List<String> textLines = [
    "Earth, the OG planet, is just 93 million miles from the Sun.",
    "It's about 3,959 miles wide.",
    "And guess what? If you weigh 100 pounds on Earth, you still weigh 100 pounds. No cosmic diet here!",
    "Earth's the chill party host in the solar system!"
    // Add more lines of text as needed.
  ];

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // Start the text animation after 5 seconds
      setState(() {
        // Set a flag to trigger the animation
        animationStarted = true;
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: augmentedRealityViewCreated,
          ),
          if (animationStarted)
            Positioned(
              bottom: 16, // Adjust the top position as needed
              left: 16, // Adjust the left position as needed
              child: Container(
                width: 200, // Set your fixed container width.
                height: 170,
                padding: EdgeInsets.all(0),
                child: ListView(
                  children: <Widget>[
                    TypewriterAnimatedTextKit(
                      totalRepeatCount: 1,
                      speed: Duration(milliseconds: 50),
                      text: textLines,
                      textStyle: TextStyle(
                        color: FlutterMaterial.Colors.white,
                        fontFamily: 'basis',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    augmentedRealityCoreController?.dispose();
    rotationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }
}
