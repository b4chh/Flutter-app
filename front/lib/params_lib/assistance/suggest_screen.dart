import 'dart:async';

import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:async';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Param_suggest extends StatefulWidget {
  const Param_suggest({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _suggestPageState createState() => _suggestPageState();
}

// ignore: always_specify_types
Future<http.Response> makePostRequest(email, password, passwordconf) async {
  final Uri url = Uri.parse('http://192.168.1.94:3000/auth/updatepass?email=$email&password=$password&confirmPass=$passwordconf');
  final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};
  final http.Response response = await http.patch(url, headers: headers);
  return response;
}

// ignore: camel_case_types
class _suggestPageState extends State<Param_suggest> {
  final TextEditingController mysuggestcontroller = TextEditingController();
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0), // Changer la couleur ici
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Aidez-nous à ameliorer Wearver', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            TextField(
              controller: mysuggestcontroller,
              maxLines: 20, // Adjust the number of lines as needed
              decoration: const InputDecoration(
                hintText: 'Faite-nous part de vos idées',
                border: OutlineInputBorder(), // Optional: Add border styling
              ),
            ),
            const Text("L'équipe de Wearver vous remercie de l'attention que vous porter à nous aider", style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 108, 108, 108)),),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () async {
              // ignore: avoid_print
              print(mysuggestcontroller.text);
              await showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 250,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Votre message a été envoyé ! Nous répondrons à votre message aussi vite que possible Merci de votre patience',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          width: double.infinity,
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Divider(
                            color: Color.fromARGB(255, 238, 238, 238),
                            thickness: 1,
                          ),
                        ),
                        Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Material(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/Param');
                              },
                              onHighlightChanged: (bool isHighlighted) {
                                  // Handle highlight change
                                },
                                splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                                highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                              child: const Center(
                                child:
                                  Text(
                                    'Retour',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Divider(
                            color: Color.fromARGB(255, 238, 238, 238),
                            thickness: 1,
                          ),
                        ),
          const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            );},
            child: const Text('Envoyer'),
          ),
          ],
        ),
      ),
    );
  }
}
