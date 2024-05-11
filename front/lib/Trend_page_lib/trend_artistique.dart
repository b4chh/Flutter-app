import 'package:flutter/material.dart';

class Trend_art extends StatefulWidget {
  const Trend_art ({Key? key}) : super(key: key);

  @override
  _Trend_art createState() => _Trend_art();
}

class _Trend_art extends State<Trend_art> {
  final MyMessageController = TextEditingController();
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    List<String> imageAssetPaths = [
      'assets/a1.png',
      'assets/a2.png',
      'assets/a3.png',
      'assets/a4.png',
      'assets/a5.png',
      'assets/a6.png',
      'assets/a7.png',
      'assets/a8.png',
      'assets/a9.png',
      'assets/a10.png',
      'assets/a11.png',
      'assets/a12.png',
      'assets/a13.png',
      'assets/a14.png',
      'assets/a17.png',
      'assets/a15.png',
      'assets/a16.png',
      'assets/a18.png',
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 145, 53, 244),
        iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 0, 0, 0), // Changer la couleur ici
          ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        title: const Text("TOP ARTISTIQUE", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Font'),),
      ),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics (),
        itemCount: (500 / 2).ceil(), // Number of rows // imageAssetPaths.length
        itemBuilder: (context, rowIndex) {
        final int startIndex = rowIndex * 2;
          final int endIndex = startIndex + 2;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = startIndex; i < endIndex; i++)
                if (i < 500) // imageAssetPaths.length
                  GestureDetector(
                    onTap: () {
                      print(imageAssetPaths[i]);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(2), // Add padding here
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 4, // Adjust the width
                        height: 190, // Adjust the height
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 27, 27, 27),
                          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                        ),
                        child: Stack(
                        children: <Widget> [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/art.png', // Replace with the path to your local image asset
                              fit: BoxFit.cover, // Adjust the fit property as needed
                            ),
                          ),
                        Positioned(
                           // Adjust the left position as needed
                          top: 140, // Adjust the top position as needed
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 4,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(150, 51, 51, 51),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),   // Top-left corner remains unchanged (0 radius)
                                topRight: Radius.circular(0),  // Top-right corner remains unchanged (0 radius)
                                bottomLeft: Radius.circular(10.0), // Bottom-left corner with no radius
                                bottomRight: Radius.circular(10.0),// Bottom-right corner with no radius
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: const Text('Nom de createur', style: TextStyle(fontSize: 16, fontFamily: 'Apple', color: Color.fromARGB(255, 255, 255, 255)),),),
                          ),
                        ),
                        ],
                        ),
                      ),
                    )
                )
            ],
          );
        },
      ),
    );
  }
}