import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to show the splash screen for 3 seconds before loading the main app screen
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FirstScreen()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,  84, 74, 86),
      body: Center(
        child: Image.asset('assets/Wearver.jpg',
            width: 300,
            height: 300,
          ),
      ),
    );
  }
}