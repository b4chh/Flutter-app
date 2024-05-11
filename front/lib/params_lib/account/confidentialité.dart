import 'package:flutter/material.dart';
//import 'dart:convert';
import 'dart:async';
// import 'dart:convert';
// import 'dart:async';
//import '../../global_lib.dart' as global;
import 'package:http/http.dart' as http;
//import 'package:http/http.dart' as http;

class Passwordchange extends StatefulWidget {
  const Passwordchange({Key? key}) : super(key: key);

  @override
  _PasswordchangePageState createState() => _PasswordchangePageState();
}

// int handle_response(response) {
//   if (response.statusCode == 200) {
//     return 1;
//   } else {
//     return 0;
//   }
// }

Future<http.Response> makePostRequest(email, password, passwordconf) async {
  final url = Uri.parse('http://192.168.1.94:3000/auth/updatepass?email=$email&password=$password&confirmPass=$passwordconf');
  final headers = {"Content-type": "application/json"};
  final response = await http.patch(url, headers: headers);
  return response;
}

class _PasswordchangePageState extends State<Passwordchange> {
  final MyEmailController = TextEditingController();
  final MyPasswordController = TextEditingController();
  final MyPasswordconfController = TextEditingController();

  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    MyEmailController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Changer de mot de passe', style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),),
            const SizedBox(height: 10),
            Text('entrez votre email et votre nouveau mot de passe', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            const SizedBox(height: 15),
            SizedBox(
            width: 390,
            child: TextField(
                controller: MyEmailController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "Email",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
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
                controller: MyPasswordController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "Nouveau mot de passe",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
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
                controller: MyPasswordconfController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "confirmation mot de passe",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(370, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //Définir le rayon du bord arrondi
              ),
              side: BorderSide(
                width: 1.0,
                color: Color.fromARGB(255, 255, 255, 255),
                style: BorderStyle.solid,
              ),
              textStyle: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              animationDuration: Duration.zero,
              backgroundColor: Color.fromARGB(255, 164, 134, 245),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
                if (MyEmailController.text.contains("@") && MyEmailController.text.contains(".")
                && MyEmailController.text.isNotEmpty && MyPasswordController.text == MyPasswordconfController.text)
                 {
                  print(MyEmailController.text);
                  print(MyPasswordController.text);
                  print(MyPasswordconfController.text);
                  final response = await makePostRequest(MyEmailController.text, MyPasswordController.text, MyPasswordconfController.text);
                  print(response.body);
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    Navigator.pop(context);
                  }
                  if (response.statusCode == 500) {
                    print("Email or password is incorrect111");
                  }
                  else {
                    MyEmailController.clear();
                    MyPasswordController.clear();
                    MyPasswordconfController.clear();
                  }
                }
                else {
                  print("Email or password is incorrect");
                  MyEmailController.clear();
                  MyPasswordController.clear();
                }
            },
            child: const Text('Changer de mot de passe', style: TextStyle(fontSize: 15),),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
            backgroundColor: Color.fromARGB(255, 164, 134, 245),
          ),
          ],
        ),
      ),
      ],
      ),
    );
  }
}