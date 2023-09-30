
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart' as FlutterMaterial; // Alias for Flutter's Colors

class saturn extends StatefulWidget {
  const saturn({Key? key}) : super(key: key);

  @override
  State<saturn> createState() => _saturnState();
}

class _saturnState extends State<saturn> {
  ArCoreController? augmentedRealityCoreController;

  void augmentedRealityViewCreated(ArCoreController coreController) {
    augmentedRealityCoreController = coreController;
    displayEarthMapSphere(augmentedRealityCoreController!);
  }

  Future<void> displayEarthMapSphere(ArCoreController coreController) async {
    final ByteData earthTextureBytes = await rootBundle.load('assets/images/saturn.jpg');
    final material = ArCoreMaterial(
      color: FlutterMaterial.Colors.blue, // Specify Colors from FlutterMaterial package
      textureBytes: earthTextureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [material],
    );
    final node = ArCoreNode(
      shape: sphere,
      position: Vector3(0, 0, -1.5),
    );
    augmentedRealityCoreController!.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Earth Map'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: augmentedRealityViewCreated,
          ),
          Positioned(
            top: 16, // Adjust the top position as needed
            left: 16, // Adjust the left position as needed
            child: Text(
              'Your Overlay Text3',
              style: TextStyle(
                color: FlutterMaterial.Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
    super.dispose();
  }
}

