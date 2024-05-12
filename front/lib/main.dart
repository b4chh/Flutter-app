import 'package:flutter/material.dart';
import 'package:wearver_project/Trend_page_lib/trend_artistique.dart';
import 'package:wearver_project/Trend_page_lib/trend_classic.dart';
import 'package:wearver_project/Trend_page_lib/trend_exotic.dart';
import 'package:wearver_project/Trend_page_lib/trend_new.dart';
import 'package:wearver_project/Trend_page_lib/trend_streetwear.dart';
import 'package:wearver_project/Trend_page_lib/trend_trend.dart';
import 'package:wearver_project/admin_log.dart';
import 'package:wearver_project/first_screen.dart';
import 'package:wearver_project/home_screen.dart';
import 'package:wearver_project/login_screen.dart';
import 'package:wearver_project/new_first_screen.dart';
import 'package:wearver_project/param_screen.dart';
import 'package:wearver_project/params_lib/account/confidentialité.dart';
import 'package:wearver_project/params_lib/assistance/help_screen.dart';
import 'package:wearver_project/params_lib/assistance/policy_screen.dart';
import 'package:wearver_project/params_lib/assistance/problem_screen.dart';
import 'package:wearver_project/params_lib/assistance/rules_screen.dart';
import 'package:wearver_project/params_lib/assistance/suggest_screen.dart';
import 'package:wearver_project/params_lib/info/info_delivery.dart';
import 'package:wearver_project/password_help.dart';
import 'package:wearver_project/register_screen.dart';
import 'package:wearver_project/splash_screen.dart';

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
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const NewFirstScreen(),
        '/Delivery_data': (BuildContext context) => const Delivery_data(),
        '/Owner' : (BuildContext context) => const Adminscreen(),
        '/Splash': (BuildContext context) => const SplashScreen(),
        '/first': (BuildContext context) => const FirstScreen(),
        '/Login': (BuildContext context) => const Login(),
        '/Register': (BuildContext context) => const Register(),
        '/Home': (BuildContext context) => const Home(),
        '/Param':(BuildContext context) => const Param(),
        '/Param_help':(BuildContext context) => const Param_help(),
        '/Param_policy':(BuildContext context) => const Param_policy(),
        '/Param_rules':(BuildContext context) => const Param_rules(),
        '/Param_suggest':(BuildContext context) => const Param_suggest(),
        '/Param_problem':(BuildContext context) => const Param_problem(),
        '/PasswordHelp':(BuildContext context) => const Password(),
        '/Trend_new':(BuildContext context) => const Trend_new(),
        '/Trend_trend':(BuildContext context) => const Trend_trend(),
        '/Trend_street':(BuildContext context) => const Trend_streetwear(),
        '/Trend_art':(BuildContext context) => const Trend_art(),
        '/Trend_exo':(BuildContext context) => const Trend_exotic(),
        '/Trend_classic':(BuildContext context) => const Trend_classic(),
        '/Changepswd':(BuildContext context) => const Passwordchange(),
      },
    ),);
}

// ignore: public_member_api_docs
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details,) {
    return child;
  }
}

// ignore: public_member_api_docs
class MyApp extends StatelessWidget {
  // ignore: public_member_api_docs
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent, hoverColor: Colors.transparent,),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
