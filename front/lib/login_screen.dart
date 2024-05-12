import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:async';
//import 'package:http/http.dart' as http;
// import 'package:testing_flutter/home_screen.dart';
// import 'global_lib.dart' as global;

// ignore: public_member_api_docs
class Login extends StatefulWidget {
  // ignore: public_member_api_docs
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

// int handle_response(response) {
//   if (response.statusCode == 200) {
//     return 1;
//   } else {
//     return 0;
//   }
// }

// Future<http.Response> makePostRequest(email, password) async {
//   final url = Uri.parse('http://192.168.1.30:8080/login');
//   final headers = {"Content-type": "application/json"};
//   final json = '{"email": "$email", "password": "$password"}';
//   final response = await http.post(url, headers: headers, body: json);
//   return response;
// }

class _LoginPageState extends State<Login> {
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            //   Image.asset('assets/hello.gif',
            //   scale: 5,
            // ),
            const Text('Sign in', style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),),
            const SizedBox(height: 15),
            TextField(
              controller: myemailcontroller,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              maxLength: 15,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: mypasswordcontroller,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () async {await Navigator.pushNamed(context, '/Home');},
            //   onPressed: () async {
            //     if (myemailcontroller.text.contains("@") && myemailcontroller.text.contains(".")
            //     && mypasswordcontroller.text.length >= 8 && myemailcontroller.text.isNotEmpty)
            //      {
            //       final response = await makePostRequest(myemailcontroller.text, mypasswordcontroller.text);
            //       print(response.body);
            //       if (response.body == "OK") {
            //         global.email = myemailcontroller.text;
            //         Navigator.pushNamed(context, '/Home');
            //       }
            //       else {
            //         myemailcontroller.clear();
            //         mypasswordcontroller.clear();
            //       }
            //     }
            //     else {
            //       print("Email or password is incorrect");
            //       myemailcontroller.clear();
            //       mypasswordcontroller.clear();
            //     }
            // },
            child: const Text('Submit'),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(context, '/');
            },
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            child: const Icon(Icons.arrow_back),
          ),
          ],
        ),
      ),
    );
  }
}
