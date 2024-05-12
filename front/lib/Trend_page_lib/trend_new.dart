import 'package:flutter/material.dart';

// ignore: camel_case_types
class Trend_new extends StatefulWidget {
  const Trend_new({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Trend_new createState() => _Trend_new();
}

// ignore: camel_case_types
class _Trend_new extends State<Trend_new> {
  final TextEditingController mymessagecontroller = TextEditingController();
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 145, 53, 244),
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 0, 0, 0), // Changer la couleur ici
          ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        title: const Text('TOP NOUVEAUTÉ', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Font'),),
      ),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics (),
        itemCount: (500 / 2).ceil(), // Number of rows // imageAssetPaths.length
        itemBuilder: (BuildContext context, int rowIndex) {
        final int startIndex = rowIndex * 2;
          final int endIndex = startIndex + 2;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              for (int i = startIndex; i < endIndex; i++)
                if (i < 500) // imageAssetPaths.length
                  GestureDetector(
                    onTap: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2), // Add padding here
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 4, // Adjust the width
                        height: 190, // Adjust the height
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 27, 27, 27),
                          borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
                        ),
                        child: Stack(
                        children: <Widget> [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/new.png', // Replace with the path to your local image asset
                              fit: BoxFit.cover, // Adjust the fit property as needed
                            ),
                          ),
                        Positioned(
                           // Adjust the left position as needed
                          top: 140, // Adjust the top position as needed
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 4,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(150, 51, 51, 51),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10), // Bottom-left corner with no radius
                                bottomRight: Radius.circular(10),// Bottom-right corner with no radius
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Nom de createur', style: TextStyle(fontSize: 16, fontFamily: 'Apple', color: Color.fromARGB(255, 255, 255, 255)),),),
                          ),
                        ),
                        ],
                        ),
                      ),
                    ),
                ),
            ],
          );
        },
      ),
    );
  }
}
