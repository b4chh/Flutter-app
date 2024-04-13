import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:async';
//import 'package:http/http.dart' as http;
// import 'package:testing_flutter/home_screen.dart';
// import 'global_lib.dart' as global;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
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
  final MyEmailController = TextEditingController();
  final MyPasswordController = TextEditingController();
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  void dispose() {
    MyEmailController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            //   Image.asset('assets/hello.gif',
            //   scale: 5,
            // ),
            const Text('Sign in', style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),),
            const SizedBox(height: 15),
            TextField(
              controller: MyEmailController,
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
              controller: MyPasswordController,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {Navigator.pushNamed(context, '/Home');},
            //   onPressed: () async {
            //     if (MyEmailController.text.contains("@") && MyEmailController.text.contains(".")
            //     && MyPasswordController.text.length >= 8 && MyEmailController.text.isNotEmpty)
            //      {
            //       final response = await makePostRequest(MyEmailController.text, MyPasswordController.text);
            //       print(response.body);
            //       if (response.body == "OK") {
            //         global.email = MyEmailController.text;
            //         Navigator.pushNamed(context, '/Home');
            //       }
            //       else {
            //         MyEmailController.clear();
            //         MyPasswordController.clear();
            //       }
            //     }
            //     else {
            //       print("Email or password is incorrect");
            //       MyEmailController.clear();
            //       MyPasswordController.clear();
            //     }
            // },
            child: const Text('Submit'),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(Icons.arrow_back),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
          ],
        ),
      ),
    );
  }
}