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


class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Adminhome createState() => _Adminhome();
}

class _Adminhome extends State<Adminhome> {
  //Adminhome({super.key});
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
          const Text('Ajouter un article 🚀', style: TextStyle(fontSize: 27, fontFamily: 'Apple',color: Color.fromARGB(255, 0, 0, 0),letterSpacing: 0.001,),),
          const SizedBox(height: 130),
          SizedBox(
            width: 390,
            child: TextField(
              style: const TextStyle(color: Colors.white),
                controller: myemailcontroller,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                  hintText: "Nom de L'article",
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
                  hintText: 'Description',
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
                  hintText: 'Prix',
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
                color: Color.fromARGB(255, 176, 190, 242),
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
                    await Navigator.pushNamed(context, '/Adminhome');
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
            child: const Text(' Ajouter au vente ', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Apple2'),),
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
            onPressed: () {
              // ignore: avoid_print
              print('Déconnexion');
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Déconnexion',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          ),
          const SizedBox(height: 15),
        ],
        ),
      ),
      ],
      ),
    );
  }
}