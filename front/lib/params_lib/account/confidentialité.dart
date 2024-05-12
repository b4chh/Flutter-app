// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:async';
//import '../../global_lib.dart' as global;
import 'package:http/http.dart' as http;
//import 'package:http/http.dart' as http;

// ignore: public_member_api_docs
class Passwordchange extends StatefulWidget {
  // ignore: public_member_api_docs
  const Passwordchange({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordchangePageState createState() => _PasswordchangePageState();
}

// int handle_response(response) {
//   if (response.statusCode == 200) {
//     return 1;
//   } else {
//     return 0;
//   }
// }

// ignore: always_specify_types, public_member_api_docs
Future<http.Response> makePostRequest(email, password, passwordconf) async {
  final Uri url = Uri.parse('http://192.168.1.94:3000/auth/updatepass?email=$email&password=$password&confirmPass=$passwordconf');
  final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};
  final http.Response response = await http.patch(url, headers: headers);
  return response;
}

class _PasswordchangePageState extends State<Passwordchange> {
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
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            const Text('Changer de mot de passe', style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),),
            const SizedBox(height: 10),
            const Text('entrez votre email et votre nouveau mot de passe', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
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
                controller: mypasswordconfcontroller,
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
                && myemailcontroller.text.isNotEmpty && mypasswordcontroller.text == mypasswordconfcontroller.text)
                 {
                  final http.Response response = await makePostRequest(myemailcontroller.text, mypasswordcontroller.text, mypasswordconfcontroller.text);
                  if (response.statusCode == 200) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                  if (response.statusCode == 500) {
                  }
                  else {
                    myemailcontroller.clear();
                    mypasswordcontroller.clear();
                    mypasswordconfcontroller.clear();
                  }
                }
                else {
                  myemailcontroller.clear();
                  mypasswordcontroller.clear();
                }
            },
            child: const Text('Changer de mot de passe', style: TextStyle(fontSize: 15),),
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
