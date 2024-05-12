// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Param_policy extends StatefulWidget {
  const Param_policy({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<Param_policy> {
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
        title: const Text('Politique de confidentialité', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('WEARVER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('''Chez Wearver, nous accordons une grande importance à la confidentialité des informations personnelles de nos utilisateurs. Cette politique de confidentialité décrit comment nous collectons, utilisons, protégeons et partageons les données que vous nous fournissez lorsque vous utilisez notre plateforme.''', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text("Collecte d'informations", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Nous collectons certaines informations personnelles que vous nous fournissez volontairement lors de votre inscription sur notre plateforme. Les types d'informations collectées peuvent inclure, sans s'y limiter :"
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 9),
            Text('''
 1. Votre nom, adresse e-mail et autres coordonnées de contact.
 2. Des informations relatives à votre profil et à votre boutique en ligne, telles que votre image de marque, vos créations, votre histoire et vos descriptions de produits.
 3. Les interactions que vous avez avec notre plateforme, y compris les commentaires, les likes et les partages.'''
              , style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Utilisation des informations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Nous utilisons les informations collectées dans le but de vous fournir nos services et d'améliorer votre expérience sur notre plateforme. Les principales utilisations de vos informations peuvent inclure :"
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 9),
            Text('''
 1. La création et la personnalisation de votre boutique en ligne.
 2. La mise en valeur de vos créations et de votre expertise auprès des utilisateurs de notre plateforme.
 3. La possibilité pour les utilisateurs de découvrir, suivre, aimer et partager vos créations.
 4. La communication avec vous concernant les mises à jour, les promotions et d'autres informations pertinentes liées à notre plateforme.'''
              , style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Protection des informations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Nous mettons en place des mesures de sécurité appropriées pour protéger vos informations personnelles contre tout accès non autorisé, la perte, l'utilisation abusive ou la divulgation. Nous limitons également l'accès à vos informations personnelles aux employés et aux tiers qui ont besoin de les connaître pour fournir nos services."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Partage des informations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text('• Nous ne partageons pas vos informations personnelles avec des tiers à des fins de marketing direct sans votre consentement. Cependant, veuillez noter que vos informations, y compris vos créations et votre profil public, seront visibles et accessibles par les utilisateurs de notre plateforme.'
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Vos choix et droits', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text('• Vous pouvez accéder, mettre à jour et supprimer vos informations personnelles en accédant à votre compte sur notre plateforme. Vous avez également le droit de demander la suppression de vos informations personnelles en nous contactant. Cependant, veuillez noter que la suppression de certaines informations peut entraîner la perte de fonctionnalités et de contenus associés à votre compte.'
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text('Modifications de la politique de confidentialité', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("• Nous pouvons mettre à jour cette politique de confidentialité de temps à autre pour refléter les changements dans nos pratiques de collecte et d'utilisation des informations. Nous vous encourageons à consulter régulièrement cette politique pour rester informé de nos pratiques en matière de confidentialité."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 10),
            Text("Si vous avez des questions ou des préoccupations concernant notre politique de confidentialité, n'hésitez pas à nous contacter. Votre confiance est importante pour nous, et nous nous engageons à protéger vos informations personnelles et à vous offrir une expérience sécurisée sur notre plateforme."
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text("Date d'entrée en vigueur : 11/07/2023"
              , style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),),
            SizedBox(height: 15),
            Text("Merci d'utiliser notre plateforme et de partager votre talent avec la communauté."
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
