import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'constants.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

final _controller = PageController(
  initialPage: 0,
);

int _currentPage =0;

List<Widget> _pages=[
  Column(
    children: [
      Expanded(child: Image.asset('images/deliverylocation1.png')),
      Text('Set your default delivery location', style: kPageViewTextStyle,textAlign:TextAlign.center,),
    ],
  ),

  Column(
    children: [
      Expanded(child: Image.asset('images/orderaproduct.png')),
      Text('Order Online and get it delivered', style: kPageViewTextStyle,textAlign:TextAlign.center),
    ],
  ),

  Column(
    children: [
      Expanded(child: Image.asset('images/deliverylocation2.png')),
      Text('Swift Delivery To Your Door Step', style: kPageViewTextStyle,textAlign:TextAlign.center),
    ],
  ),
];

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (index){
              setState(() {
                _currentPage = index;
              });

            },
          ),
        ),
        SizedBox(height: 20,),
        DotsIndicator(
          dotsCount: _pages.length,
          position: _currentPage.toDouble(),
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              activeColor: Colors.deepOrange
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
