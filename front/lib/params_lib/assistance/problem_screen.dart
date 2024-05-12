// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:async';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Param_problem extends StatefulWidget {
  const Param_problem({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _problemPageState createState() => _problemPageState();
}

// ignore: always_specify_types
Future<http.Response> makePostRequest(email, password, passwordconf) async {
  final Uri url = Uri.parse('http://192.168.1.94:3000/auth/updatepass?email=$email&password=$password&confirmPass=$passwordconf');
  final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};
  final http.Response response = await http.patch(url, headers: headers);
  return response;
}

// ignore: camel_case_types
class _problemPageState extends State<Param_problem> {
  final TextEditingController myissuecontroller = TextEditingController();
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
        title: const Text('Quel problème rencontrer-vous ?', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            TextField(
              controller: myissuecontroller,
              maxLines: 20, // Adjust the number of lines as needed
              decoration: const InputDecoration(
                hintText: 'Parlez-nous de votre problème',
                border: OutlineInputBorder(), // Optional: Add border styling
              ),
            ),
            const Text('Veillez noter que notre temps de réponse peut varier en fonction du nombre de demande', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 108, 108, 108)),),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () async {
              // ignore: avoid_print
              print(myissuecontroller.text);
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
                          "Votre message a été envoyé ! Nous répondrons à votre demande d'assistance aussi vite que possible Merci de votre patience",
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
