


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{

  FirebaseAuth _auth = FirebaseAuth.instance;

  late String smsOtp;
  late String verificationId;

  // setting getters

  get verificationCompleted => null;

  get verificationFailed => null;

  get codeSent => null;

  get codeAutoRetrievalTimeout => null;



  Future<void>verifyPhone(BuildContext context,String number)async{

    final PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential credential)async{
      await _auth.signInWithCredential(credential);
    };

    final PhoneVerificationFailed verificationFailed = (FirebaseAuthException e){
      print(e.code);
    };

    final PhoneCodeSent smsOtpSend = (String verId, int? resendToken)async{
      this.verificationId =verId;

      // This is the dialog to enter received OTP for sms

      smsOtpDialog(context, number);

    };


    try{
      _auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);



    }catch(e){
      print(e);
    }
  }

  Future<bool?>smsOtpDialog(BuildContext context, String number){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Column(
              children: [
                Text('Verification Code'),
                SizedBox(height: 6,),
                Text('Enter the 6 digits code received as sms',
                  style: TextStyle(color: Colors.grey,fontSize: 13),
                ),
              ],
            ),
            content: Container(
              height: 85,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                onChanged: (value){
                  this.smsOtp = value;
                },
              ),
            ) ,
            actions: [
              TextButton(
                  onPressed: ()async{
                    try{
                     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsOtp);

                     final User? user =(await _auth.signInWithCredential(credential)).user;

                     // navigating to home page after user logs in
                      if(user!=null){
                        Navigator.of(context).pop();

                        // making sure the app does not redirect to welcome screen
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context)=>HomeScreen();
                        ));
                      }


                    }catch(e){}
                  },
                  child: Text('DONE'),
              ),
            ],
          );
        }
    );
  }

}