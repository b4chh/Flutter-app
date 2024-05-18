//import 'dart:convert';
// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'dart:convert';
// import 'dart:async';
import 'package:wearver_project/global_lib.dart' as global;
//import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

// int handle_response(response) {
//   if (response.statusCode == 200) {
//     return 1;
//   } else {
//     return 0;
//   }
// }

// ignore: always_specify_types
// Future<http.Response> makePostRequest(firstname, lastname, email, password, username) async {
//   final Uri url = Uri.parse('http://192.168.1.94:3000/auth/register?email=$email&password=$password&username=$username&firstName=$firstname&lastName=$lastname');
//   final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};
//   final http.Response response = await http.post(url, headers: headers);
//   return response;
// }

Future<http.Response> makePostRequest(String email, String password, String username, String firstName, String lastName, String role) async {
  final Uri url = Uri.parse('https://api-weaver.onrender.com/auth/register');
  final Map<String, String> headers = <String, String>{
    'Content-type': 'application/json',
  };

  final Map<String, String> body = <String, String>{
    'email': email,
    'password': password,
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'role': role,
  };

  final String jsonBody = jsonEncode(body);

  final http.Response response = await http.post(
    url,
    headers: headers,
    body: jsonBody,
  );

  return response;
}

class _RegisterPageState extends State<Register> {
  final TextEditingController myemailcontroller = TextEditingController();
  final TextEditingController mypasswordcontroller = TextEditingController();
  final TextEditingController mypasswordconfirmcontroller = TextEditingController();
  final TextEditingController firsnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
            Image.asset('assets/celebrate.gif',
              scale: 3,
            ),
            //Text('Sign up', style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),),
            const SizedBox(height: 15),
            SizedBox(
            width: 390,
            child: TextField(
                controller: firsnamecontroller,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: 'Firstname',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
            width: 390,
            child: TextField(
                controller: lastnamecontroller
            ,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: 'Lastname',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
            width: 390,
            child: TextField(
                controller: usernamecontroller
            ,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: 'Username',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            SizedBox(
            width: 390,
            child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: mypasswordcontroller,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
            width: 390,
            child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: mypasswordconfirmcontroller,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                && myemailcontroller.text.isNotEmpty
                && mypasswordcontroller.text == mypasswordconfirmcontroller.text && firsnamecontroller.text.isNotEmpty
                && lastnamecontroller
            .text.isNotEmpty)
                 {
                  final http.Response response = await makePostRequest(myemailcontroller.text, mypasswordcontroller.text, usernamecontroller
          .text, firsnamecontroller.text, lastnamecontroller
              .text, 'acheteur',);
                  // ignore: avoid_print
                  print(response.body);
                  // ignore: avoid_print
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    global.email = myemailcontroller.text;
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                  else {
                    // ignore: avoid_print
                    print('User already exists');
                    myemailcontroller.clear();
                    mypasswordcontroller.clear();
                    firsnamecontroller.clear();
                    lastnamecontroller
                .clear();
                    usernamecontroller
                .clear();
                    mypasswordconfirmcontroller.clear();
                  }
                }
                else {
                  // ignore: avoid_print
                  print('Email or password is incorrect');
                  myemailcontroller.clear();
                  mypasswordcontroller.clear();
                  firsnamecontroller.clear();
                  lastnamecontroller
              .clear();
                  usernamecontroller
              .clear();
                  mypasswordconfirmcontroller.clear();
                }
            },
            child: const Text('Sign up', style: TextStyle(fontSize: 17),),
          ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //   primary: Color.fromARGB(255, 0, 0, 0),
            // ),
            //   onPressed: () { Navigator.pushNamed(context, '/Home');},
              // onPressed: () async {
              //   if (myemailcontroller.text.contains("@") && myemailcontroller.text.contains(".")
              //   && mypasswordcontroller.text.length >= 8 && myemailcontroller.text.isNotEmpty
              //   && mypasswordcontroller.text == mypasswordconfirmcontroller.text && firsnamecontroller.text.isNotEmpty
              //   && lastnamecontroller
              //.text.isNotEmpty)
              //    {
              //     final response = await makePostRequest(firsnamecontroller.text, lastnamecontroller
              //.text, myemailcontroller.text, mypasswordcontroller.text),,;
              //     if (response.body == "OK") {
              //       Navigator.pushNamed(context, '/Login');
              //     }
              //     else {
              //       print("User already exists");
              //       myemailcontroller.clear();
              //       mypasswordcontroller.clear();
              //       firsnamecontroller.clear();
              //       lastnamecontroller
              //.clear();
              //     }
              //   }
              //   else {
              //     print("Email or password is incorrect");
              //     myemailcontroller.clear();
              //     mypasswordcontroller.clear();
              //     firsnamecontroller.clear();
              //     lastnamecontroller
              //.clear();
              //   }
            // },
          //   child: const Text('Submit'),
          // ),
          FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(context, '/');
            },
            backgroundColor: const Color.fromARGB(255, 164, 134, 245),
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(height: 80),
          ],
        ),
      ),
        ],
            ),
    );
  }
}
