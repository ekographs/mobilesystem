import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobilesystem/screens/onboard_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(
      Duration(
        seconds: 4,
      ),(){
       Navigator.pushReplacement(context, MaterialPageRoute
         (builder: (context)=>OnBoardScreen(),
       ));
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
            child: Image.asset('images/nekologo.png')),
      ),
    );
  }
}
