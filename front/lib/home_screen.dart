import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'dart:convert';
import 'dart:async';
//import 'dart:io';
//import 'dart:html';
import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int handle_response(response) {
  if (response.statusCode == 200) {
    return 1;
  } else {
    return 0;
  }
}

Future<http.Response> makePostRequest(email, password) async {
  final url = Uri.parse('http://192.168.1.91:3000/login');
  final headers = {"Content-type": "application/json"};
  final json = '{"email": "$email", "password": "$password"}';
  final response = await http.post(url, headers: headers, body: json);
  return response;
}

// Future<String?> _selectAndCropImage() async {
//   final picker = ImagePicker();
//   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//   if (pickedImage != null) {
//     final croppedImage = await ImageCropper.cropImage(
//       sourcePath: pickedImage.path,
//       aspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9),
//       compressQuality: 70,
//       maxHeight: 800,
//       maxWidth: 800,
//       androidUiSettings: AndroidUiSettings(
//         toolbarTitle: 'Crop Image',
//         toolbarColor: Colors.deepOrange,
//         toolbarWidgetColor: Colors.white,
//         initAspectRatio: CropAspectRatioPreset.original,
//         lockAspectRatio: false,
//       ),
//       iosUiSettings: IOSUiSettings(
//         minimumAspectRatio: 1.0,
//       ),
//     );        
//     if (croppedImage != null) {
//       // Use the cropped image path here
//       return croppedImage.path;
//     }
//   }

//   return null;
// }









class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Set the preferred height of the AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          centerTitle: true, // Center the title and actions
          title: Image.asset(
            'assets/logo2.gif', // Replace with your image asset path
            scale: 8,
          ),
        ),
      ),
        body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics (),
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
          Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 30,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), //Définir le rayon du bord arrondi
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    style: BorderStyle.solid,
                  ),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  backgroundColor: Color.fromARGB(255, 227, 231, 234),
                  //onPrimary: Color.fromARGB(255, 50, 114, 209),
                ),
                onPressed: () {
                  print("Nouveauté");
                  Navigator.pushNamed(context, '/Trend_new');
                },
                child: const Text('Nouveauté', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Apple2')),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), //Définir le rayon du bord arrondi
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    style: BorderStyle.solid,
                  ),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  backgroundColor: Color.fromARGB(255, 227, 231, 234),
                  //onPrimary: Color.fromARGB(255, 50, 114, 209),
                ),
                onPressed: () {
                  print("Tendances");
                  Navigator.pushNamed(context, '/Trend_trend');
                },
                child: const Text('Tendances', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Apple2')),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    style: BorderStyle.solid,
                  ),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  backgroundColor: Color.fromARGB(255, 227, 231, 234),
                  //onPrimary: Color.fromARGB(255, 50, 114, 209),
                ),
                onPressed: () {
                  print("Streetwear");
                  Navigator.pushNamed(context, '/Trend_street');
                },
                child: const Text('Streetwear', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Apple2')),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), //Définir le rayon du bord arrondi
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    style: BorderStyle.solid,
                  ),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  backgroundColor: Color.fromARGB(255, 227, 231, 234),
                  //onPrimary: Color.fromARGB(255, 50, 114, 209),
                ),
                onPressed: () {
                  print("Classic");
                  Navigator.pushNamed(context, '/Trend_classic');
                },
                child: const Text('Classic', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Apple2')),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), //Définir le rayon du bord arrondi
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    style: BorderStyle.solid,
                  ),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  backgroundColor: Color.fromARGB(255, 227, 231, 234),
                  //onPrimary: Color.fromARGB(255, 50, 114, 209),
                ),
                onPressed: () {
                  print("Artistique");
                  Navigator.pushNamed(context, '/Trend_art');
                },
                child: const Text('Artistique', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Apple2')),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), //Définir le rayon du bord arrondi
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    style: BorderStyle.solid,
                  ),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  backgroundColor: Color.fromARGB(255, 227, 231, 234),
                  //onPrimary: Color.fromARGB(255, 50, 114, 209),
                ),
                onPressed: () {
                  print("Exotique");
                  Navigator.pushNamed(context, '/Trend_exo');
                },
                child: const Text('Exotique', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ]
          ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(right: 75.0),
        child:  const Text('Notre coup de coeur', style: TextStyle(fontSize: 27, fontFamily: 'Apple',color: Color.fromARGB(255, 21, 21, 21),letterSpacing: 0.001,),),
        ),
        SizedBox(height: 10),
      Container(
        width: double.infinity, // Takes up the maximum width
          margin: EdgeInsets.symmetric(horizontal: 20.0), // Adjust the spacing from the max width
          height: 500.0, // Set the height to 500
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 227, 231, 234),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0), // Adjust the shadow offset as needed
              ),
            ],
            borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/top1.png', // Replace with the path to your local image asset
              fit: BoxFit.cover, // Adjust the fit property as needed
            ),
          ),
      ),
      SizedBox(height: 30),
      Stack(
            children: <Widget> [
      Container(
        width: double.infinity, // Takes up the maximum width
          margin: EdgeInsets.symmetric(horizontal: 20.0), // Adjust the spacing from the max width
          height: 500.0, // Set the height to 500
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 227, 231, 234),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0), // Adjust the shadow offset as needed
              ),
            ],
            borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/commercial.jpg', // Replace with the path to your local image asset
              fit: BoxFit.cover, // Adjust the fit property as needed
            ),
          ),
      ),
      const Positioned(
                top: 25,
                left: 35,
                child: Text('Découvrer Wearver', style: TextStyle(fontSize: 27, fontFamily: 'Apple',color: Color.fromARGB(255, 70, 70, 70),letterSpacing: 0.001,),),
      ),
      Positioned(
                top: 65,
                left: 35,
                child: Image.asset(
              'assets/logo.png', scale: 15, // Replace with the path to your local image asset
            ),
      ),
            ]
      ),
      SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.only(right: 75.0),
        child:  const Text('Créateurs tendances', style: TextStyle(fontSize: 27, fontFamily: 'Apple',color: Color.fromARGB(255, 21, 21, 21),letterSpacing: 0.001,),),
        ),
      Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 170,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150, // Takes up the maximum width
                margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0), // Adjust the spacing from the max width
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 231, 234),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 0), // Adjust the shadow offset as needed
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
                )
              ),
              Container(
                width: 150, // Takes up the maximum width
                margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0), // Adjust the spacing from the max width
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 231, 234),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 0), // Adjust the shadow offset as needed
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
                )
              ),
              Container(
                width: 150, // Takes up the maximum width
                margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0), // Adjust the spacing from the max width
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 231, 234),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 0), // Adjust the shadow offset as needed
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
                )
              ),
              Container(
                width: 150, // Takes up the maximum width
                margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0), // Adjust the spacing from the max width
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 231, 234),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 0), // Adjust the shadow offset as needed
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
                )
              ),
              Container(
                width: 150, // Takes up the maximum width
                margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0), // Adjust the spacing from the max width
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 231, 234),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 0), // Adjust the shadow offset as needed
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
                )
              ),
        ]
        ),
    ),
    SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(right: 260.0),
                child: Text('Top 10', style: TextStyle(fontSize: 27, fontFamily: 'Apple',color: Color.fromARGB(255, 21, 21, 21),letterSpacing: 0.001,),),
                ),
                SizedBox(height: 10),
        ]
        ),
        )
    );
  }
}












class PageSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MysearchController = TextEditingController();
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 145, 53, 244),
        iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 0, 0, 0), // Changer la couleur ici
          ),
        title: Column(
        children: [
        SizedBox(
              width: 390,
              height: 50,
              child: TextField(
                enableSuggestions: false,
                autocorrect: false,
                controller: MysearchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  hintText: "Calendrier",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 184, 184, 184), fontFamily: 'Apple2'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 176, 190, 242)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              ),
            ),
          const SizedBox(height: 5),
        ]
      ),
      ),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics (),
        itemCount: (imageAssetPaths.length / 2).ceil(), // Number of rows
        itemBuilder: (context, rowIndex) {
        final int startIndex = rowIndex * 3;
          final int endIndex = startIndex + 3;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = startIndex; i < endIndex; i++)
                if (i < imageAssetPaths.length)
                  GestureDetector(
                    onTap: () {
                      print(imageAssetPaths[i]);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(1), // Add padding here
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 2, // Adjust the width
                        height: 190, // Adjust the height
                        child: Image.asset(
                          imageAssetPaths[i],
                          fit: BoxFit.cover, // Adjust the image scaling
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






class PageMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("tu n'a aucun message pour le moment 🥲"),
    );
  }
}







class PageProfile extends StatelessWidget {
  // final _HomePageState parent;

  // PageProfile(this.parent, {File? defaultImage}) {
  //   // Use the defaultImage if parent.image is null
  //   if (parent.image == null && defaultImage != null) {
  //     parent.image = defaultImage;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: <Widget> [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Material (
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: InkWell(
                    onTap: () {
                    },
                  ),)
              ),
              Container(
                width: double.infinity,
                height: 200,
                child: Material(
                  color: Colors.transparent, // Make the Material widget transparent
                  child: Ink.image(
                    image: AssetImage('assets/test.gif'), // Change 'your_image.png' to your image path
                    fit: BoxFit.cover, // You can adjust the fit property as needed
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 150,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: Material(
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: InkWell(
                                onTap: () {
                                  print("Container clicked");
                                  //parent.pickImage();
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
                              child: Icon(Icons.edit),
                            ),
                                    ),
                                    Text(
                                      'Modifer la bannière',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
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
                            color: Color.fromARGB(255, 214, 214, 214),
                            thickness: 1,
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
                                Navigator.pop(context);
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
                              child: Icon(Icons.arrow_back_ios),
                            ),
                                  ),
                                  Text(
                                    'Annuler',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ]
                    ),
                  ),
                );
                },
                  );
                        print("click");
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 10,
                child: IconButton(
                  onPressed: () {
                showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 250,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
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
                                    Text(
                                      'Partager mon profil',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
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
                            color: Color.fromARGB(255, 214, 214, 214),
                            thickness: 1,
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
                                      padding: EdgeInsets.only(left: 16.0, right: 8.0),
                                      child: IconTheme(
                              data: IconThemeData(color: Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.edit),
                            ),
                                    ),
                                    Text(
                                      'Modifier mon profil',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
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
                            color: Color.fromARGB(255, 214, 214, 214),
                            thickness: 1,
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
                                Navigator.pushNamed(context, '/Param');
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
                              child: Icon(Icons.settings),
                            ),
                                  ),
                                  Text(
                                    'Paramètres et confidentialité',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          height: 1,
                          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          child: Divider(
                            color: const Color.fromARGB(255, 214, 214, 214),
                            thickness: 1,
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
                                Navigator.of(context).pop();
                                showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
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
                          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          child: Divider(
                            color: Color.fromARGB(255, 238, 238, 238),
                            thickness: 1,
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
                                Navigator.pushNamed(context, '/');
                              },
                              onHighlightChanged: (isHighlighted) {
                                  // Handle highlight change
                                },
                                splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                                highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                              child: const Center(
                                child:
                                  Text(
                                    'Déconnexion',
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
                          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          child: Divider(
                            color: Color.fromARGB(255, 238, 238, 238),
                            thickness: 1,
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
                                Navigator.of(context).pop();
                              },
                              onHighlightChanged: (isHighlighted) {
                                  // Handle highlight change
                                },
                                splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                                highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
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
                              onHighlightChanged: (isHighlighted) {
                                  // Handle highlight change
                                },
                                splashColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed
                                highlightColor: Color.fromARGB(255, 210, 210, 210), // Color when pressed and held
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0, right: 8.0),
                                    child: IconTheme(
                              data: IconThemeData(color: const Color.fromARGB(255, 138, 138, 138)), // Change the color here
                              child: Icon(Icons.logout),
                            ),
                                  ),
                                  Text(
                                    'Déconnexion',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
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
              icon: const Icon(Icons.dehaze_rounded),
            ),
              ),
              Positioned(
                top: 135,
                left: 10,
                child: GestureDetector(
                onTap: () {
                  print("Container clicked");
                  showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 150,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: Material(
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: InkWell(
                                onTap: () {
                                  print("Container clicked");
                                  //parent.pickImage();
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
                              child: Icon(Icons.edit),
                            ),
                                    ),
                                    Text(
                                      'Modifer la photo de profil',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
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
                            color: Color.fromARGB(255, 214, 214, 214),
                            thickness: 1,
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
                                Navigator.pop(context);
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
                              child: Icon(Icons.arrow_back_ios),
                            ),
                                  ),
                                  Text(
                                    'Annuler',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ]
                    ),
                  ),
                );
                },
                  );
                },
                child: Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 145, 53, 244),
                  border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                child: 
                Image.asset('assets/logo.png', fit: BoxFit.cover), // Default image
            ),
                
          ),
              ),
              ),
            ]
              ),
        ),
          );
    }
}

class _HomePageState extends State<Home> {
  int _currentIndex = 0;
  // final ScrollController _homeController = ScrollController();
  final List<Widget> _children = [
    PageHome(),
    PageSearch(),
    PageMessage(),
    PageProfile(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 220, 226, 249),
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0),),
            label: "Accueil"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0),),
            label: "Rechercher"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Color.fromARGB(255, 0, 0, 0),),
            label: "Message"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, color: Color.fromARGB(255, 0, 0, 0),),
            label: "Profil"
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }

  void onTabTapped(int index) {
      setState(() {_currentIndex = index;});
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}