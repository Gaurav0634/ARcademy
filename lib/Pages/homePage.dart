
import 'package:flutter/material.dart';
import 'package:space_ar/Pages/mercury.dart';
import 'package:space_ar/Pages/venus.dart';
import 'package:space_ar/planets/earth.dart';
import 'package:space_ar/planets/mars.dart';
import '../planets/saturn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    Mercury(),
    const Venus(),
    const Earth(),
    const Mars(),
    const saturn(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: Image.asset(
              'assets/icons/mercury.png', // Replace with your image path

              width: 35,
              height: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: Image.asset(
              'assets/icons/venus.png', // Replace with your image path

              width: 35,
              height: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: Image.asset(
              'assets/icons/earth.png', // Replace with your image path

              width: 35,
              height: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: Image.asset(
              'assets/icons/mars.png', // Replace with your image path

              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
    );
  }
}
