import 'package:flutter/material.dart';
import 'package:mobilesystem/screens/onboard_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: OnBoardScreen()),
          Text('Excited to order from your nearest store?'),
          SizedBox(height: 20,),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {},
            child: Text('Set Your Delivery Location'),

          ),
        ],
      ),
    );
  }
}
