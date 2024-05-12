//import 'dart:convert';
// ignore_for_file: always_specify_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'dart:convert';
// import 'dart:async';
//import 'package:http/http.dart' as http;
// ignore: camel_case_types, public_member_api_docs
class Delivery_data extends StatefulWidget {
  // ignore: public_member_api_docs
  const Delivery_data({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Delivery_data createState() => _Delivery_data();
}

// Future<http.Response> makePostRequest(email, password, passwordconf) async {
//   final Uri url = Uri.parse('http://192.168.1.94:3000/auth/updatepass?email=$email&password=$password&confirmPass=$passwordconf');
//   final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};
//   final http.Response response = await http.patch(url, headers: headers);
//   return response;
// }

// class _Delivery_data extends State<Delivery_data> {
//   final TextEditingController mymessagecontroller = TextEditingController();
//   final ButtonStyle style =
//         ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 235, 235, 235),
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: const Color.fromARGB(255, 235, 235, 235),
//         iconTheme: const IconThemeData(
//             color: Color.fromARGB(255, 0, 0, 0), // Changer la couleur ici
//           ),
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         title: const Text('Comment pouvons-nous vous aider ?', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget> [
//             const SizedBox(height: 15),
//             TextField(
//               controller: mymessagecontroller,
//               maxLines: 20, // Adjust the number of lines as needed
//               decoration: const InputDecoration(
//                 hintText: 'Parlez-nous de votre problème',
//                 border: OutlineInputBorder(), // Optional: Add border styling
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text('Veillez noter que notre temps de réponse peut varier en fonction du nombre de demande', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 108, 108, 108)),),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//             ),
//             onPressed: () async {
//               // ignore: avoid_print
//               print(mymessagecontroller.text);
//               await showModalBottomSheet<void>(
//               context: context,
//               builder: (BuildContext context) {
//                 return Container(
//                   height: 250,
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   padding: const EdgeInsets.all(8),
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         const Text(
//                           "Votre message a été envoyé ! Nous répondrons à votre demande d'assistance aussi vite que possible Merci de votre patience",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color.fromARGB(255, 0, 0, 0),
//                           ),
//                         ),
//                         const SizedBox(height: 25),
//                         Container(
//                           width: double.infinity,
//                           height: 1,
//                           margin: const EdgeInsets.symmetric(horizontal: 8),
//                           child: const Divider(
//                             color: Color.fromARGB(255, 238, 238, 238),
//                             thickness: 1,
//                           ),
//                         ),
//                         Center(
//                         child: SizedBox(
//                           width: double.infinity,
//                           height: 50,
//                           child: Material(
//                             color: const Color.fromARGB(255, 255, 255, 255),
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.pushNamed(context, '/Param');
//                               },
//                               onHighlightChanged: (bool isHighlighted) {
//                                   // Handle highlight change
//                                 },
//                                 splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
//                                 highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
//                               child: const Center(
//                                 child:
//                                   Text(
//                                     'Retour',
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                           width: double.infinity,
//                           height: 1,
//                           margin: const EdgeInsets.symmetric(horizontal: 8),
//                           child: const Divider(
//                             color: Color.fromARGB(255, 238, 238, 238),
//                             thickness: 1,
//                           ),
//                         ),
//           const SizedBox(height: 10),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );},
//             child: const Text('Envoyer'),
//           ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// ignore: camel_case_types
class _Delivery_data extends State<Delivery_data> {
  bool positionStreamStarted = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocation Example'),
      ),
      body: Center(
        child: _position != null ? Text('Current Location: $_position'): const Text('No location data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Position? _position;
Future<void> _getCurrentLocation() async {
    final Position position = await _determinePosition();
    setState(() {
      _position = position;
    });
  }
Future<Position> _determinePosition() async {
    LocationPermission permission;
permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.',);
    }
// When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // ignore: unnecessary_await_in_return
    return await Geolocator.getCurrentPosition();
  }
}
