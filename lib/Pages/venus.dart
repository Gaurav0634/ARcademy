import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart' as FlutterMaterial; // Alias for Flutter's Colors

class Venus extends StatefulWidget {
  const Venus({Key? key}) : super(key: key);

  @override
  State<Venus> createState() => _VenusState();
}

class _VenusState extends State<Venus> with SingleTickerProviderStateMixin {
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
    displayVenusSphere(augmentedRealityCoreController!);
  }

  Future<void> displayVenusSphere(ArCoreController coreController) async {
    final ByteData venusTextureBytes = await rootBundle.load('assets/images/venus.jpg');
    final material = ArCoreMaterial(
      color: FlutterMaterial.Colors.blue, // Specify Colors from FlutterMaterial package
      textureBytes: venusTextureBytes.buffer.asUint8List(),
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
    "Meet Venus, the Sun's sunbathing buddy, who likes to sunbathe just 67 million miles away – talk about a hot neighbor!",
    "Now, Venus isn't the biggest planet at the cosmic party, measuring around 3,760 miles across. But let me tell you, it's got a personality as big as Jupiter's!",
    "And when it comes to gravity, well, Venus has a different sense of style. If you weighed 100 pounds on Earth, you'd suddenly feel like a svelte 91 pounds on Venus. It's like cosmic weight loss without even trying!",
    "So, there you have it, Venus, the confident and light-hearted planet that's always up for a laugh in our solar system shindig!"
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
