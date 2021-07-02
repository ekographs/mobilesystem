import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

final _controller = PageController(
  initialPage: 0,
);

List<Widget> _pages=[
  Column(
    children: [
      Image.asset('images/deliverylocation1.png'),
      Text('Set your default delivery location'),
    ],
  ),

  Column(
    children: [
      Image.asset('images/orderaproduct.png'),
      Text('Order Online and get it delivered'),
    ],
  ),

  Column(
    children: [
      Image.asset('images/deliverylocation2.png'),
      Text('Swift Delivery To Your Door Step'),
    ],
  ),
];

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _pages,
      ),
    );
  }
}
