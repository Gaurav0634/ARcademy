// import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
// import 'package:space_ar/Pages/appBar.dart';
//
// import 'encyclopedia.dart';
//
// class Homepage1 extends StatefulWidget {
//   const Homepage1({Key? key}) : super(key: key);
//
//   @override
//   State<Homepage1> createState() => _Homepage1State();
// }
//
// class _Homepage1State extends State<Homepage1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: CustomAppBar1(title: "ARcademy",),
//       drawer: AppDrawer(),
//
//       body: Stack(
//         fit: StackFit.expand, // Make the Stack fill the entire screen
//         children: [
//           Image.asset(
//             'assets/images/bg1.jpg', // Replace with your background image path
//             fit: BoxFit.cover,
//           ),
//           Center(
//             child: const ModelViewer(
//
//               src: 'https://spacear.s3.ap-south-1.amazonaws.com/models/fad1f8a62d3848d0be664339e6f3b1a2.glb',
//               arModes: ['scene-viewer', 'webxr'],
//               poster: '',
//               ar: true,
//               autoRotate: true,
//               loading: Loading.eager,
//
//
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space_ar/Pages/appBar.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SolarBar(title: "ARcademy",),
      drawer: AppDrawer(),

      body: Stack(
        fit: StackFit.expand, // Make the Stack fill the entire screen
        children: [
          Image.asset(
            'assets/images/bg.jpg', // Replace with your background image path
            fit: BoxFit.cover,
          ),
          Center(
            child: const ModelViewer(
              src: 'https://spacear.s3.ap-south-1.amazonaws.com/models/fad1f8a62d3848d0be664339e6f3b1a2.glb',
              arModes: ['scene-viewer', 'webxr'],
              poster: '',
              ar: true,
              autoRotate: true,
              loading: Loading.eager,
            ),
          ),
        ],
      ),
    );
  }
}

class SolarBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  SolarBar({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back), // Use the appropriate back icon
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(
              '/introVideo'); // Replace '/home' with your actual home page route
        }
      ),
      title: Text(
        title,
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
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
    );
  }
}
