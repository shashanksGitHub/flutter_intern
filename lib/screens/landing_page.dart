import 'package:flutter/material.dart';
import 'package:flutter_intern/screens/form_page.dart';
import 'package:flutter_intern/screens/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    Register(),

  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.red, Colors.black],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Text(
          "Flutter Intern",
          style: TextStyle(
              fontSize: 35.0, color: Colors.white, fontFamily: "Signatra"),
        ),
        centerTitle: true,
      ),





      // backgroundColor: kBackgroundColor,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap:onTappedBar,

        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              label:'Home',
              backgroundColor: Colors.black
          ),

          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userMd),
              label:'Registration Form',
              backgroundColor: Colors.black
          ),

    ],
    selectedItemColor: Colors.lightBlue,
      ),
    );
  }
}

