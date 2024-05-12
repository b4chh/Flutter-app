// ignore_for_file: camel_case_types, public_member_api_docs

import 'package:flutter/material.dart';

class Param_rules extends StatefulWidget {
  const Param_rules({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends State<Param_rules> {
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
        title: const Text("Conditions d'utilisation", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('WEARVER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('''Merci d'utiliser notre application et de prendre connaissance de notre Charte de Conditions d'Utilisation. Cette charte décrit les conditions et les règles auxquelles vous devez vous conformer lors de l'utilisation de nos services.''', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Acceptation des Conditions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• En utilisant notre application, vous acceptez pleinement et sans réserve les présentes Conditions d'Utilisation. Si vous n'êtes pas d'accord avec ces conditions, veuillez ne pas utiliser nos services."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Utilisation du Service', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Notre application est destinée à être utilisée conformément à son objectif principal, qui est [indiquer l'objectif principal de l'application]. Vous vous engagez à n'utiliser nos services que dans le cadre légal et à respecter les droits des autres utilisateurs."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Propriété Intellectuelle', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Tous les droits de propriété intellectuelle liés à notre application, y compris le contenu, les marques de commerce et les droits d'auteur, sont la propriété de [Nom de votre entreprise]. Vous ne pouvez pas reproduire, distribuer ou utiliser notre contenu sans autorisation préalable."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text("Responsabilité de l'Utilisateur", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Vous êtes responsable de toutes les actions entreprises via votre compte. Vous vous engagez à ne pas utiliser notre application de manière abusive, diffamatoire, frauduleuse ou contraire à la loi. Vous êtes également responsable du maintien de la confidentialité de vos informations d'identification."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Modifications et Interruptions du Service', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Nous nous réservons le droit de modifier ou d'interrompre nos services à tout moment, sans préavis. Nous ne serons pas responsables des conséquences résultant de telles modifications ou interruptions."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Limitation de Responsabilité', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Nous nous efforçons de fournir des services de qualité, mais nous ne pouvons garantir l'absence d'erreurs ou de pannes. Nous ne serons pas responsables des dommages directs ou indirects résultant de l'utilisation de notre application."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text('Confidentialité des Données', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Nous accordons une grande importance à la confidentialité de vos données personnelles. Veuillez consulter notre Politique de Confidentialité pour en savoir plus sur la collecte, l'utilisation et la protection de vos informations."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text('Contact', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Si vous avez des questions, des préoccupations ou des réclamations concernant notre application ou ces Conditions d'Utilisation, veuillez nous contacter à l'adresse suivante : Wearver.support@wearver.com."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text('''En utilisant notre application, vous acceptez d'être lié par ces Conditions d'Utilisation. Nous nous réservons le droit de mettre à jour ou de modifier ces conditions à tout moment. Veuillez consulter cette charte régulièrement pour prendre connaissance des éventuelles modifications.''', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text("Date d'entrée en vigueur : 11/07/2023"
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text("Merci de lire attentivement notre Charte de Conditions d'Utilisation et de respecter ces règles lors de votre utilisation de notre application."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("        L'équipe de Wearver"
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            
          SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
