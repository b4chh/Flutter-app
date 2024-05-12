// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class NewFirstScreen extends StatefulWidget {
  const NewFirstScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewFirstScreen createState() => _NewFirstScreen();
}

class _NewFirstScreen extends State<NewFirstScreen> {
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
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
          Image.asset('assets/Wearver.png',
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 10),
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
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              animationDuration: Duration.zero,
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
              await Navigator.pushNamed(context, '/Owner');
            },
            child: const Text(' Vendre (Administrateur) ', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255) ,fontFamily: 'Apple2'),),
          ),
          const SizedBox(height: 30),
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
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              //onPrimary: Color.fromARGB(255, 50, 114, 209),
            ),
            onPressed: () async {
              await Navigator.pushNamed(context, '/first');
            },
            child: const Text(' Acheter ', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Apple2'),),
          ),
        ],
        ),
      ),
      ],
      ),
    );
  }
}
