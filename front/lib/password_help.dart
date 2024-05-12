//import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:async';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart' as http;

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordPageState createState() => _PasswordPageState();
}

// int handle_response(response) {
//   if (response.statusCode == 200) {
//     return 1;
//   } else {
//     return 0;
//   }
// }

// ignore: always_specify_types
Future<http.Response> makePostRequest(email, password, passwordconf) async {
  final Uri url = Uri.parse('http://192.168.1.94:3000/auth/updatepass?email=$email&password=$password&confirmPass=$passwordconf');
  final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};
  final http.Response response = await http.patch(url, headers: headers);
  return response;
}

class _PasswordPageState extends State<Password> {
  final TextEditingController myemailcontroller = TextEditingController();
  final TextEditingController mypasswordcontroller = TextEditingController();
  final TextEditingController mypasswordconfcontroller = TextEditingController();

  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myemailcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255,  212, 212, 212),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgr.png'), //backgr.png
                fit: BoxFit.cover,
              ),
            ),
          ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            const Text('Trouvez votre compte', style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),),
            const SizedBox(height: 10),
            const Text('Entrez votre adresse e-mail pour nous aidez à vous retrouver', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 255, 255)),),
            const SizedBox(height: 15),
            SizedBox(
            width: 390,
            child: TextField(
                controller: myemailcontroller,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
            width: 390,
            child: TextField(
              obscureText: true,
                controller: mypasswordcontroller,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: 'Nouveau mot de passe',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
            width: 390,
            child: TextField(
              obscureText: true,
                controller: mypasswordconfcontroller
            ,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: 'confirmation mot de passe',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
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
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              animationDuration: Duration.zero,
              backgroundColor: const Color.fromARGB(255, 164, 134, 245),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
                if (myemailcontroller.text.contains('@') && myemailcontroller.text.contains('.')
                && myemailcontroller.text.isNotEmpty && mypasswordcontroller.text == mypasswordconfcontroller
            .text)
                 {
                  // ignore: avoid_print
                  print(myemailcontroller.text);
                  // ignore: avoid_print
                  print(mypasswordcontroller.text);
                  // ignore: avoid_print
                  print(mypasswordconfcontroller
              .text,);
                  final http.Response response = await makePostRequest(myemailcontroller.text, mypasswordcontroller.text, mypasswordconfcontroller
              .text,);
                  // ignore: avoid_print
                  print(response.body);
                  // ignore: avoid_print
                  print(response.statusCode);
                  if (response.statusCode == 200) {
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
                    mypasswordconfcontroller
                .clear();
                  }
                }
                else {
                  // ignore: avoid_print
                  print('Email or password is incorrect');
                  myemailcontroller.clear();
                  mypasswordcontroller.clear();
                }
            },
            child: const Text(' trouver le compte ', style: TextStyle(fontSize: 15),),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: const Color.fromARGB(255, 164, 134, 245),
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
