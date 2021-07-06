import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilesystem/screens/onboard_screen.dart';

import 'constants.dart';

class WelcomeScreen extends StatelessWidget {

  bool _validphoneNumber = false;

  void showBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (context)=> StatefulBuilder(
            builder: (context, StateSetter myState){
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LOGIN', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Text('Kindly enter your phone number to proceed', style: TextStyle(fontSize: 13, color: Colors.grey),),
                      SizedBox(height:20,),
                      TextField(
                        decoration: InputDecoration(
                          prefixText: '+230',
                          labelText: '8 digits number',
                        ),
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        maxLength: 8,
                        onChanged: (value){
                          if(value.length==8){
                            myState((){
                              _validphoneNumber =true;
                            });
                          }else{
                            myState((){
                              _validphoneNumber =false;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children:[
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: _validphoneNumber ? false:true,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: _validphoneNumber? Colors.blueAccent : Colors.grey,
                                  primary: Colors.white,
                                ),
                                child: Text(_validphoneNumber? 'CONTINUE':'ENTER YOUR PHONE NUMBER'),
                                onPressed: (){},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            ),
    );
  }

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
                Text('Excited to order from your nearest store?', style: TextStyle(fontSize: 18, color: Colors.grey)),
                SizedBox(height: 30,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    alignment: Alignment.center,
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                  child: const Text('SET DELIVERY LOCATION',style: TextStyle(color: Colors.white),),
                  onPressed: () {},
                ),

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
                  onPressed: (){
                    showBottomSheet(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
