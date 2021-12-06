import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'email_verification.dart';
import 'api/APIHandler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locations.dart' as locations;
import 'dart:async';

class Resources extends StatefulWidget {
  const Resources({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Resources> createState() => _Resources();
}

class _Resources extends State<Resources> {
  final Map<String, Marker> _markers = {};

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  // void _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  Shader linearGradient = const LinearGradient(
    colors: [
      Colors.green,
      Colors.yellow,
    ],
  ).createShader(
    const Rect.fromLTWH(50.0, 0.0, 300.0, 70.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurple,
              Colors.indigo,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 2,
              ),
              markers: _markers.values.toSet(),
            ),

            // Back button
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
