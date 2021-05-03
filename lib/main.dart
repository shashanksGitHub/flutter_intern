import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intern/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
          GoogleFonts.varelaRoundTextTheme(Theme.of(context).textTheme),
        ),
        home: SplashScreen(),

    );
  }
}
