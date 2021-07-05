import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilesystem/screens/onboard_screen.dart';

import 'constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
              right: 0.0,
              top: 20.0,
              child: TextButton(
                child: Text('SKIP',style: TextStyle(color: Colors.blueAccent),),
                onPressed: (){},
              ),
            ),
            Column(
              children: [
                Expanded(child: OnBoardScreen(),),
                Text('Excited to order from your nearest store?', style: TextStyle(fontSize: 18,) ),
                SizedBox(height: 30,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    alignment: Alignment.center,
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                  onPressed: () {},
                  child: const Text('Set Delivery Location',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 30,),
                TextButton(
                  child: RichText(text: TextSpan(
                    text: 'Returning Customer?', style: TextStyle(fontSize: 18,color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Login here',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  ),
                  onPressed: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
