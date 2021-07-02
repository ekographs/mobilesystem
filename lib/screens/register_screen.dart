import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('images/nekologo.png'),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
          ],

        ),
      ),
    );
  }
}