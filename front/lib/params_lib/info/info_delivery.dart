//import 'dart:convert';
// ignore_for_file: always_specify_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// ignore: camel_case_types, public_member_api_docs
class Delivery_data extends StatefulWidget {
  // ignore: public_member_api_docs
  const Delivery_data({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Delivery_data createState() => _Delivery_data();
}

// ignore: camel_case_types
class _Delivery_data extends State<Delivery_data> {
  bool positionStreamStarted = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Me geolocaliser'),
      ),
      body: Center(
        child: _position != null ? Text('Current Location: $_position'): const Text('Aucune localisation'),
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
        return Future.error('Location permissions are denied');
      }
    }
if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.',);
    }
    return Geolocator.getCurrentPosition();
  }
}
