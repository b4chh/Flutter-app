import 'package:flutter/material.dart';
//import 'package:testing_flutter/login_google.dart';
import 'global_lib.dart' as global;
import 'dart:async';
import 'package:http/http.dart' as http;


Future<http.Response> makePostRequest(email, password) async {
  final url = Uri.parse('http://192.168.1.94:3000/auth/login?email=$email&password=$password');
  final headers = {"Content-type": "application/json"};
  // final json = '{"email": "$email", "password": "$password"}';
  // final response = await http.post(url, headers: headers, body: json);
  final response = await http.post(url, headers: headers);
  return response;
}


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  //FirstScreen({super.key});
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
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Color.fromARGB(255,  212, 212, 212),
      body: Stack(
        children: [
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
          const SizedBox(height: 130),
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
              style: TextStyle(color: Colors.white),
                controller: MyEmailController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184), fontFamily: 'Font'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 390,
              child: TextField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: MyPasswordController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                  hintText: "Mot de passe",
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 184, 184, 184), fontFamily: 'Font'),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
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
                width: 1.0,
                color: Color.fromARGB(255, 176, 190, 242),
                style: BorderStyle.solid,
              ),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              animationDuration: Duration.zero,
              backgroundColor: Color.fromARGB(255, 224, 118, 68),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
                if (MyEmailController.text.contains("@") && MyEmailController.text.contains(".")
                && MyEmailController.text.isNotEmpty)
                 {
                  final response = await makePostRequest(MyEmailController.text, MyPasswordController.text);
                  print(response.body);
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    global.email = MyEmailController.text;
                    Navigator.pushNamed(context, '/Home');
                  }
                  if (response.statusCode == 500) {
                    print("Email or password is incorrect111");
                  }
                  else {
                    MyEmailController.clear();
                    MyPasswordController.clear();
                  }
                }
                else {
                  print("Email or password is incorrect");
                  MyEmailController.clear();
                  MyPasswordController.clear();
                }
            },
            // onPressed: () {
            //   Navigator.pushNamed(context, '/Home');
            // },
            child: const Text(' Se connecter ', style: TextStyle(fontSize: 16, fontFamily: 'Font'),),
          ),
          TextButton(
            child: Text('Mot de passe oublié ?',  style: TextStyle(color :Color.fromARGB(255, 255, 255, 255), fontFamily: 'Font',)),
            onPressed: () {
              Navigator.pushNamed(context, '/PasswordHelp');
            }
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(370, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //Définir le rayon du bord arrondi
              ),
              side: const BorderSide(
                width: 1.0,
                color: Color.fromARGB(255, 176, 190, 242),
                style: BorderStyle.solid,
              ),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              animationDuration: Duration.zero,
              backgroundColor: Color.fromARGB(255, 224, 118, 68),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Register');
            },
            child: const Text(' Créer un compte ', style: TextStyle(fontSize: 15, fontFamily: 'Font'),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //Définir le rayon du bord arrondi
              ),
              side: const BorderSide(
                width: 1.0,
                color: Color.fromARGB(255, 255, 255, 255),
                style: BorderStyle.solid,
              ),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              backgroundColor: Color.fromARGB(255, 49, 42, 50),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () {
              print("skip");
              Navigator.pushNamed(context, '/Home');
            },
            child: const Text('SKIP'),
          ),
        ],
        ),
      ),
      ],
      ),
    );
  }
}