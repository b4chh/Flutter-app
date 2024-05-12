// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:wearver_project/first_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to show the splash screen for 3 seconds before loading the main app screen
    Timer(const Duration(seconds: 3), () async => Navigator.pushReplacement(
      context,
      // ignore: always_specify_types
      MaterialPageRoute(builder: (BuildContext context) => const FirstScreen()),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255,  84, 74, 86),
      body: Center(
        child: Image.asset('assets/Wearver.jpg',
            width: 300,
            height: 300,
          ),
      ),
    );
  }
}
