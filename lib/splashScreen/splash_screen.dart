import 'dart:async';

import 'package:cabongo/authentication/login_screen.dart';
import 'package:cabongo/authentication/sign_screen.dart';
import 'package:cabongo/global/global.dart';
import 'package:cabongo/mainScreen/main_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{
  startTimer()
  {
    Timer( const Duration(seconds: 1),() async {
      if(await fAuth.currentUser !=null)
      {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));

      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
      }
      //send user to main screen

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/COG.png"),

              const SizedBox(height: 10,),

              const Text(
                "Cab On GO",
                 style: TextStyle(
                  fontSize: 30,
                 color: Colors.white,
                fontWeight: FontWeight.bold

              ),
              ),
            ],

            )
            )
      ),
    );
  }
}
