import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intern/common_widgets/loading_widget.dart';
import 'package:flutter_intern/screens/landing_page.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
{

  @override
  void initState() {
    super.initState();

    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 3), () async{

      Route route = MaterialPageRoute(builder: (_) => LandingPage());
      Navigator.pushReplacement(context, route);


    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child:Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.green, Colors.lightBlue],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.0,),
                circularProgress(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
