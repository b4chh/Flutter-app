import 'package:flutter/material.dart';

class Param extends StatefulWidget {
  const Param({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ParamPageState createState() => _ParamPageState();
}

class _ParamPageState extends State<Param> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 235, 235, 235),
        iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 0, 0, 0), // Changer la couleur ici
          ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              //Navigator.pushNamed(context, '/Home');
            },
          ),
        title: const Text('Paramètres et confidentialité', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            //   Image.asset('assets/hello.gif',
            //   scale: 5,
            // ),
            
            const SizedBox(height: 15),
            const Text('Compte', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 116, 116, 116)),),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.account_circle_outlined),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            'Compte',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Changepswd');
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.lock),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Confidentialité',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.shield),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Sécurité',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                      // Handle highlight change
                    },
                    splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                    highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.share),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Partager mon profile',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                      // Handle highlight change
                    },
                    splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                    highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.work),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Type de compte et outils',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Comptenu et affichage', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 116, 116, 116)),),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.notification_important),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Notification',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.type_specimen),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Langue',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.dark_mode),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Affichage',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text("Informations d'achat", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 116, 116, 116)),),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.local_shipping),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Information de livraison',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.payment),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'information de paiement',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.history),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Historique des achats',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Assistance', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 116, 116, 116)),),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Param_help');
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.help),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              "Obtenir de l'aide",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Param_problem');
                    },
                    onHighlightChanged: (isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.report),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              "Signaler un problème",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                      Navigator.pushNamed(context, '/Param_suggest');
                    },
                    onHighlightChanged: (bool isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 8),
                          child: IconTheme(
                              data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.assistant),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              "J'ai une suggestion",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                      Navigator.pushNamed(context, '/Param_rules');
                    },
                    onHighlightChanged: (bool isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 8),
                          child: IconTheme(
                              data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.info),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              "Conditions d'utilisation",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                      Navigator.pushNamed(context, '/Param_policy');
                    },
                    onHighlightChanged: (bool isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 8),
                          child: IconTheme(
                              data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.policy),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Politique de confidentialité',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Connexion', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 116, 116, 116)),),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      // Handle button tap
                    },
                    onHighlightChanged: (bool isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 8),
                          child: IconTheme(
                              data: IconThemeData(color:  Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.switch_account_sharp),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Changer de compte',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                      showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Voulez-vous vraiment supprimer votre compte ?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 152, 152, 152)
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          width: double.infinity,
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                                Navigator.pushNamed(context, '/');
                              },
                              onHighlightChanged: (bool isHighlighted) {
                                  // Handle highlight change
                                },
                                splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                                highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                              child: const Center(
                                child:
                                  Text(
                                    'Supprimer',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 255, 0, 0)
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
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                                Navigator.of(context).pop();
                              },
                              onHighlightChanged: (bool isHighlighted) {
                                  // Handle highlight change
                                },
                                splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                                highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                              child: const Center(
                                child:
                                  Text(
                                    'Annuler',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                );
              },
            );
                    },
                    onHighlightChanged: (bool isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 8.0),
                          child: IconTheme(
                              data: IconThemeData(color:  Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.delete_forever),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Supprimer mon compte',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Voulez-vous vraiment vous déconnecter ?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 152, 152, 152)
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          width: double.infinity,
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                              onTap: () async {
                                await Navigator.pushNamed(context, '/');
                              },
                              onHighlightChanged: (bool isHighlighted) {
                                  // Handle highlight change
                                },
                                splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                                highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                              child: const Center(
                                child:
                                  Text(
                                    'Déconnexion',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 255, 0, 0),
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
                        Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Material(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              onHighlightChanged: (bool isHighlighted) {
                                  // Handle highlight change
                                },
                                splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                                highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                              child: const Center(
                                child:
                                  Text(
                                    'Annuler',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                );
              },
            );
                    },
                    onHighlightChanged: (bool isHighlighted) {
                        // Handle highlight change
                      },
                      splashColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed
                      highlightColor: const Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                    child: const Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 8),
                          child: IconTheme(
                              data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.logout),
                            ),
                        ),
                        Expanded(
                            child: Text(
                              'Déconnexion',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child:  IconTheme(
                            data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138), size: 15), // Change the color here
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 120),
            const Text('V1.00', style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 39, 39, 39)),),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
