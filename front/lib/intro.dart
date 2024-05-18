// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreen createState() => _IntroScreen();
}

class _IntroScreen extends State<IntroScreen> {
  bool timerr = false;
  bool selected = false;
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void initState() {
    super.initState();
    // Start a periodic timer to toggle the selected state every 2 seconds
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        selected = !selected;
      });
    });
  }
  void initStatee() {
    super.initState();
    // Start a periodic timer to toggle the selected state every 2 seconds
    Timer.periodic(const Duration(seconds: 7), (Timer timer) {
      setState(() {
        timerr = !timerr;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Color.fromARGB(255,  212, 212, 212),
      body: Stack(
        children: <Widget>[
          GestureDetector(
          onTap: () async {
            await Navigator.pushNamed(context, '/AfterIntro');
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgr.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: Center(
              child: AnimatedContainer(
                width: selected ? 120.0 : 200.0,
                height: selected ? 120.0 : 200.0,
                color: selected ? const Color.fromARGB(255, 156, 73, 245) : const Color.fromARGB(255, 255, 255, 255),
                alignment:
                    selected ? Alignment.center : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: selected ? const Color.fromARGB(255, 156, 73, 245) : const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20), // Set the border radius here
                  ),
                  child: Image.asset(
                    'assets/Wearver.png',
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 300),
          SizedBox(
            width: 250,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Apple2',
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: AnimatedTextKit(
                animatedTexts: <AnimatedText>[
                  TyperAnimatedText('Appuyer pour continuer ! 🔥🚀'),
                ],
                onTap: () {
                },
              ),
            ),
          ),
          // Image.asset('assets/Wearver.png',
          //   width: 300,
          //   height: 300,
          // ),
        ],
        ),
      ),
      ],
      ),
    );
  }
}
