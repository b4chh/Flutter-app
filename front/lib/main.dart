import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'first_screen.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'param_screen.dart';
import 'password_help.dart';
import 'params_lib/assistance/help_screen.dart';
import 'params_lib/assistance/policy_screen.dart';
import 'params_lib/assistance/problem_screen.dart';
import 'params_lib/assistance/rules_screen.dart';
import 'params_lib/assistance/suggest_screen.dart';
import 'params_lib/account/confidentialité.dart';
import 'Trend_page_lib/trend_artistique.dart';
import 'Trend_page_lib/trend_classic.dart';
import 'Trend_page_lib/trend_exotic.dart';
import 'Trend_page_lib/trend_new.dart';
import 'Trend_page_lib/trend_streetwear.dart';
import 'Trend_page_lib/trend_trend.dart';

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
        '/Splash': (context) => const SplashScreen(),
        '/': (context) => const FirstScreen(),
        '/Login': (context) => const Login(),
        '/Register': (context) => const Register(),
        '/Home': (context) => const Home(),
        '/Param':(context) => const Param(),
        '/Param_help':(context) => const Param_help(),
        '/Param_policy':(context) => const Param_policy(),
        '/Param_rules':(context) => const Param_rules(),
        '/Param_suggest':(context) => const Param_suggest(),
        '/Param_problem':(context) => const Param_problem(),
        '/PasswordHelp':(context) => const Password(),
        '/Trend_new':(context) => const Trend_new(),
        '/Trend_trend':(context) => const Trend_trend(),
        '/Trend_street':(context) => const Trend_streetwear(),
        '/Trend_art':(context) => const Trend_art(),
        '/Trend_exo':(context) => const Trend_exotic(),
        '/Trend_classic':(context) => const Trend_classic(),
        '/Changepswd':(context) => const Passwordchange(),
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
      home: const SplashScreen(),
    );
  }
}