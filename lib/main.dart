import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobilesystem/screens/register_screen.dart';

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
         (builder: (context)=>RegisterScreen(),
       ));
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/nekologo.png'),
      ),
    );
  }
}
