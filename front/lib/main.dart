import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'first_screen.dart';
import 'home_screen.dart';

void main() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      title: 'Area',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/Login': (context) => const Login(),
        '/Register': (context) => const Register(),
        '/Home': (context) => const Home(),
      },
    ));
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent, hoverColor: Colors.transparent,),
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    );
  }
}