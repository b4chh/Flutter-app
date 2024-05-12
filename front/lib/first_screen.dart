// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:testing_flutter/login_google.dart';
import 'package:wearver_project/global_lib.dart' as global;


// ignore: always_specify_types
Future<http.Response> makePostRequest(email, password) async {
  final Uri url = Uri.parse('http://192.168.1.94:3000/auth/login?email=$email&password=$password');
  final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};
  // final json = '{"email": "$email", "password": "$password"}';
  // final response = await http.post(url, headers: headers, body: json);
  final http.Response response = await http.post(url, headers: headers);
  return response;
}


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  //FirstScreen({super.key});
  // bool _ispasswordOK = false;
  // bool _isEmailOK = false;
  final TextEditingController myemailcontroller = TextEditingController();
  final TextEditingController mypasswordcontroller = TextEditingController();
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  void dispose() {
    myemailcontroller.dispose();
    super.dispose();
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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgr.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
      Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/Wearver.png',
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 90),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(20), //Définir le rayon du bord arrondi
          //     ),
          //     side: BorderSide(
          //       width: 1.0,
          //       color: Color.fromARGB(255, 255, 255, 255),
          //       style: BorderStyle.solid,
          //     ),
          //     textStyle: TextStyle(
          //       color: Color.fromARGB(255, 251, 174, 0),
          //     ),
          //     primary: Color.fromARGB(255, 49, 42, 50),
          //     // onPrimary: Color.fromARGB(0, 0, 0, 0)
          //   ),
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/Register');
          //   },
          //   child: const Text('SIGN UP'),
          // ),
          SizedBox(
            width: 390,
            child: TextField(
              style: const TextStyle(color: Colors.white),
                controller: myemailcontroller,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184), fontFamily: 'Apple2'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 390,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: mypasswordcontroller,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                  hintText: 'Mot de passe',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184), fontFamily: 'Apple2'),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              ),
            ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(370, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //Définir le rayon du bord arrondi
              ),
              side: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              animationDuration: Duration.zero,
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
                if (myemailcontroller.text.contains('@') && myemailcontroller.text.contains('.')
                && myemailcontroller.text.isNotEmpty)
                 {
                  final http.Response response = await makePostRequest(myemailcontroller.text, mypasswordcontroller.text);
                  // ignore: avoid_print
                  print(response.body);
                  // ignore: avoid_print
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    global.email = myemailcontroller.text;
                    // ignore: use_build_context_synchronously
                    await Navigator.pushNamed(context, '/Home');
                  }
                  if (response.statusCode == 500) {
                    // ignore: avoid_print
                    print('Email or password is incorrect111');
                  }
                  else {
                    myemailcontroller.clear();
                    mypasswordcontroller.clear();
                  }
                }
                else {
                  // ignore: avoid_print
                  print('Email or password is incorrect');
                  myemailcontroller.clear();
                  mypasswordcontroller.clear();
                }
            },
            // onPressed: () {
            //   Navigator.pushNamed(context, '/Home');
            // },
            child: const Text(' Se connecter ', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Apple2'),),
          ),
          TextButton(
            child: const Text('Mot de passe oublié ?',  style: TextStyle(color :Color.fromARGB(255, 255, 255, 255), fontFamily: 'Apple2',)),
            onPressed: () async {
              await Navigator.pushNamed(context, '/PasswordHelp');
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(370, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //Définir le rayon du bord arrondi
              ),
              side: const BorderSide(
                color: Color.fromARGB(255, 176, 190, 242),
              ),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              animationDuration: Duration.zero,
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
              await Navigator.pushNamed(context, '/Register');
            },
            child: const Text(' Créer un compte ', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Apple2'),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //Définir le rayon du bord arrondi
              ),
              side: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
              // ignore: avoid_print
              print('skip');
              await Navigator.pushNamed(context, '/Home');
            },
            child: const Text('SKIP',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: const Icon(Icons.arrow_back),
          ),
        ],
        ),
      ),
      ],
      ),
    );
  }
}
