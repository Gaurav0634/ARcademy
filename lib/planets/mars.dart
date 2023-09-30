// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:vector_math/vector_math_64.dart';
// import 'package:flutter/material.dart' as FlutterMaterial; // Alias for Flutter's Colors
//
// class Mars extends StatefulWidget {
//   const Mars({Key? key}) : super(key: key);
//
//   @override
//   State<Mars> createState() => _MarsState();
// }
//
// class _MarsState extends State<Mars> with SingleTickerProviderStateMixin {
//   ArCoreController? augmentedRealityCoreController;
//   bool animationStarted = false;
//   late AnimationController rotationController;
//
//   @override
//   void initState() {
//     super.initState();
//     rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 10), // You can adjust the duration as needed
//     )..repeat();
//   }
//
//   void augmentedRealityViewCreated(ArCoreController coreController) {
//     augmentedRealityCoreController = coreController;
//     displayMarsMapSphere(augmentedRealityCoreController!);
//   }
//
//   Future<void> displayMarsMapSphere(ArCoreController coreController) async {
//     final ByteData marsTextureBytes = await rootBundle.load('assets/images/mars.jpg');
//     final material = ArCoreMaterial(
//       color: FlutterMaterial.Colors.blue, // Specify Colors from FlutterMaterial package
//       textureBytes: marsTextureBytes.buffer.asUint8List(),
//     );
//     final sphere = ArCoreSphere(
//       materials: [material],
//       radius: 0.3,
//     );
//
//     final rotatingNode = ArCoreRotatingNode(
//       shape: sphere,
//       position: Vector3(0, 0, -1.5),
//       rotation: Vector4(0, 1, 0, rotationController.value * 360.0), // Rotate around the Y-axis
//     );
//
//     augmentedRealityCoreController!.addArCoreNode(rotatingNode);
//   }
//
//   List<String> textLines = [
//     "Mars, the Red Planet, hangs out around 142 million miles from the Sun.",
//     "It's not the biggest planet in town, with a radius of about 2,106 miles.",
//     "And when it comes to gravity, Mars is like a cosmic gym.",
//     "So, Mars is the place for a lighter workout in the solar system!"
//     // Add more lines of text as needed.
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 3), () {
//       // Start the text animation after 5 seconds
//       setState(() {
//         // Set a flag to trigger the animation
//         animationStarted = true;
//       });
//     });
//     return Scaffold(
//       body: Stack(
//         children: [
//           ArCoreView(
//             onArCoreViewCreated: augmentedRealityViewCreated,
//           ),
//           if (animationStarted)
//             Positioned(
//               bottom: 16, // Adjust the top position as needed
//               left: 16, // Adjust the left position as needed
//               child: Container(
//                 width: 200, // Set your fixed container width.
//                 height: 170,
//                 padding: EdgeInsets.all(0),
//                 child: ListView(
//                   children: <Widget>[
//                     TypewriterAnimatedTextKit(
//                       totalRepeatCount: 1,
//                       speed: Duration(milliseconds: 50),
//                       text: textLines,
//                       textStyle: TextStyle(
//                         color: FlutterMaterial.Colors.white,
//                         fontFamily: 'basis',
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     augmentedRealityCoreController?.dispose();
//     rotationController.dispose(); // Dispose of the animation controller
//     super.dispose();
//   }
// }import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:vector_math/vector_math_64.dart';
// import 'package:flutter/material.dart' as FlutterMaterial; // Alias for Flutter's Colors
//
// class Mars extends StatefulWidget {
//   const Mars({Key? key}) : super(key: key);
//
//   @override
//   State<Mars> createState() => _MarsState();
// }
//
// class _MarsState extends State<Mars> with SingleTickerProviderStateMixin {
//   ArCoreController? augmentedRealityCoreController;
//   bool animationStarted = false;
//   late AnimationController rotationController;
//   double rotationAngleX = 0.0; // Initial rotation angle around the X-axis
//   double rotationAngleY = 0.0; // Initial rotation angle around the Y-axis
//   ArCoreNode? rotatingNode;
//
//   @override
//   void initState() {
//     super.initState();
//     rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 10), // You can adjust the duration as needed
//     )..repeat();
//   }
//
//   void augmentedRealityViewCreated(ArCoreController coreController) {
//     augmentedRealityCoreController = coreController;
//     displayMarsMapSphere(augmentedRealityCoreController!);
//   }
//
//   Future<void> displayMarsMapSphere(ArCoreController coreController) async {
//     final ByteData marsTextureBytes = await rootBundle.load('assets/images/mars.jpg');
//     final material = ArCoreMaterial(
//       color: FlutterMaterial.Colors.blue, // Specify Colors from FlutterMaterial package
//       textureBytes: marsTextureBytes.buffer.asUint8List(),
//     );
//     final sphere = ArCoreSphere(
//       materials: [material],
//       radius: 0.3,
//     );
//
//     if (rotatingNode != null) {
//       // Remove the previous planet node
//       coreController.removeNode(nodeName: rotatingNode!.name);
//     }
//
//     rotatingNode = ArCoreNode(
//       shape: sphere,
//       position: Vector3(0, 0, -1.5),
//       rotation: Vector4(
//         rotationAngleX,
//         rotationAngleY + rotationController.value * 360.0,
//         0,
//         0,
//       ),
//     );
//
//     coreController.addArCoreNode(rotatingNode!);
//   }
//
//   List<String> textLines = [
//     "Mars, the Red Planet, hangs out around 142 million miles from the Sun.",
//     "It's not the biggest planet in town, with a radius of about 2,106 miles.",
//     "And when it comes to gravity, Mars is like a cosmic gym.",
//     "So, Mars is the place for a lighter workout in the solar system!"
//     // Add more lines of text as needed.
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 3), () {
//       // Start the text animation after 5 seconds
//       setState(() {
//         // Set a flag to trigger the animation
//         animationStarted = true;
//       });
//     });
//     return Scaffold(
//       body: GestureDetector(
//         onPanUpdate: (details) {
//           // Update the rotation angles based on finger movement
//           rotationAngleX += details.delta.dy / 100; // Adjust sensitivity as needed
//           rotationAngleY += details.delta.dx / 100; // Adjust sensitivity as needed
//           displayMarsMapSphere(augmentedRealityCoreController!);
//         },
//         child: Stack(
//           children: [
//             ArCoreView(
//               onArCoreViewCreated: augmentedRealityViewCreated,
//             ),
//             if (animationStarted)
//               Positioned(
//                 bottom: 16, // Adjust the top position as needed
//                 left: 16, // Adjust the left position as needed
//                 child: Container(
//                   width: 200, // Set your fixed container width.
//                   height: 170,
//                   padding: EdgeInsets.all(0),
//                   child: ListView(
//                     children: <Widget>[
//                       TypewriterAnimatedTextKit(
//                         totalRepeatCount: 1,
//                         speed: Duration(milliseconds: 50),
//                         text: textLines,
//                         textStyle: TextStyle(
//                           color: FlutterMaterial.Colors.white,
//                           fontFamily: 'basis',
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     augmentedRealityCoreController?.dispose();
//     rotationController.dispose(); // Dispose of the animation controller
//     super.dispose();
//   }
// }
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart' as FlutterMaterial; // Alias for Flutter's Colors

class Mars extends StatefulWidget {
  const Mars({Key? key}) : super(key: key);

  @override
  State<Mars> createState() => _MarsState();
}

class _MarsState extends State<Mars> with SingleTickerProviderStateMixin {
  ArCoreController? augmentedRealityCoreController;
  bool animationStarted = false;
  late AnimationController rotationController;
  double rotationAngleX = 0.0; // Initial rotation angle around the X-axis
  double rotationAngleY = 0.0; // Initial rotation angle around the Y-axis
  ArCoreNode? rotatingNode;

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
    displayMarsMapSphere(augmentedRealityCoreController!);
  }

  Future<void> displayMarsMapSphere(ArCoreController coreController) async {
    final ByteData marsTextureBytes = await rootBundle.load('assets/images/mars.jpg');
    final material = ArCoreMaterial(
      color: FlutterMaterial.Colors.blue, // Specify Colors from FlutterMaterial package
      textureBytes: marsTextureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.3,
    );

    if (rotatingNode != null) {
      // Remove the previous planet node
      coreController.removeNode(nodeName: rotatingNode!.name);
    }

    rotatingNode = ArCoreNode(
      shape: sphere,
      position: Vector3(0, 0, -1.5),
      rotation: Vector4(
        rotationAngleX,
        rotationAngleY + rotationController.value * 360.0,
        0,
        0,
      ),
    );

    coreController.addArCoreNode(rotatingNode!);
  }

  List<String> textLines = [
    "Mars, the Red Planet, hangs out around 142 million miles from the Sun.",
    "It's not the biggest planet in town, with a radius of about 2,106 miles.",
    "And when it comes to gravity, Mars is like a cosmic gym.",
    "So, Mars is the place for a lighter workout in the solar system!"
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
      body: GestureDetector(
        onPanUpdate: (details) {
          // Update the rotation angles based on finger movement
          rotationAngleX += details.delta.dy / 100; // Adjust sensitivity as needed
          rotationAngleY += details.delta.dx / 100; // Adjust sensitivity as needed
          displayMarsMapSphere(augmentedRealityCoreController!);
        },
        child: Stack(
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
