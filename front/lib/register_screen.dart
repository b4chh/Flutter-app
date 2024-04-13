import 'package:flutter/material.dart';
//import 'dart:convert';
import 'dart:async';
// import 'dart:convert';
// import 'dart:async';
import 'global_lib.dart' as global;
import 'package:http/http.dart' as http;
//import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// int handle_response(response) {
//   if (response.statusCode == 200) {
//     return 1;
//   } else {
//     return 0;
//   }
// }

Future<http.Response> makePostRequest(firstname, lastname, email, password, username) async {
  final url = Uri.parse('http://192.168.1.94:3000/auth/register?email=$email&password=$password&username=$username&firstName=$firstname&lastName=$lastname');
  final headers = {"Content-type": "application/json"};
  final response = await http.post(url, headers: headers);
  return response;
}

class _RegisterPageState extends State<Register> {
  final MyEmailController = TextEditingController();
  final MyPasswordController = TextEditingController();
  final MyPasswordConfirmController = TextEditingController();
  final MyFirstNameController = TextEditingController();
  final MyLastNameController = TextEditingController();
  final MyUserNameController = TextEditingController();
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
      backgroundColor: Color.fromARGB(255,  212, 212, 212),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgr.png'), //backgr.png
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Image.asset('assets/celebrate.gif',
              scale: 3,
            ),
            //Text('Sign up', style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),),
            const SizedBox(height: 15),
            SizedBox(
            width: 390,
            child: TextField(
                controller: MyFirstNameController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "Firstname",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
            width: 390,
            child: TextField(
                controller: MyLastNameController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "Lastname",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
            width: 390,
            child: TextField(
                controller: MyUserNameController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "Username",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            SizedBox(
            width: 390,
            child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: MyPasswordController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
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
                controller: MyPasswordConfirmController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
              primary: Color.fromARGB(255, 117, 68, 224),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
                if (MyEmailController.text.contains("@") && MyEmailController.text.contains(".")
                && MyEmailController.text.isNotEmpty
                && MyPasswordController.text == MyPasswordConfirmController.text && MyFirstNameController.text.isNotEmpty
                && MyLastNameController.text.isNotEmpty)
                 {
                  final response = await makePostRequest(MyFirstNameController.text, MyLastNameController.text, MyEmailController.text, MyPasswordController.text, MyUserNameController.text);
                  print(response.body);
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    global.email = MyEmailController.text;
                    Navigator.pushNamed(context, '/Home');
                  }
                  else {
                    print("User already exists");
                    MyEmailController.clear();
                    MyPasswordController.clear();
                    MyFirstNameController.clear();
                    MyLastNameController.clear();
                    MyUserNameController.clear();
                    MyPasswordConfirmController.clear();
                  }
                }
                else {
                  print("Email or password is incorrect");
                  MyEmailController.clear();
                  MyPasswordController.clear();
                  MyFirstNameController.clear();
                  MyLastNameController.clear();
                  MyUserNameController.clear();
                  MyPasswordConfirmController.clear();
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
              //   if (MyEmailController.text.contains("@") && MyEmailController.text.contains(".")
              //   && MyPasswordController.text.length >= 8 && MyEmailController.text.isNotEmpty
              //   && MyPasswordController.text == MyPasswordConfirmController.text && MyFirstNameController.text.isNotEmpty
              //   && MyLastNameController.text.isNotEmpty)
              //    {
              //     final response = await makePostRequest(MyFirstNameController.text, MyLastNameController.text, MyEmailController.text, MyPasswordController.text);
              //     if (response.body == "OK") {
              //       Navigator.pushNamed(context, '/Login');
              //     }
              //     else {
              //       print("User already exists");
              //       MyEmailController.clear();
              //       MyPasswordController.clear();
              //       MyFirstNameController.clear();
              //       MyLastNameController.clear();
              //     }
              //   }
              //   else {
              //     print("Email or password is incorrect");
              //     MyEmailController.clear();
              //     MyPasswordController.clear();
              //     MyFirstNameController.clear();
              //     MyLastNameController.clear();
              //   }
            // },
          //   child: const Text('Submit'),
          // ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(Icons.arrow_back),
            backgroundColor: Color.fromARGB(255, 117, 68, 224),
          ),
          const SizedBox(height: 80),
          ],
        ),
      ),
        ]
            ),
    );
  }
}