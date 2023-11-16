import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //future delay of 3 seconds and navigate to home page
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/introVideo');
    });
    return Scaffold(

      body: Container(

        color: Colors.black,
        child:
          Center(
            child: Image.asset('assets/images/splash.png'),
          ),
      )

    );
  }
}
