import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'email_verification.dart';
import 'api/APIHandler.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'locations.dart' as locations;
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatefulWidget {
  const Resources({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Resources> createState() => _Resources();
}

class _Resources extends State<Resources> {
  // void _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }

  // Future<void> _onMapCreated(GoogleMapController controller) async {
  //   //final googleOffices = await locations.getGoogleOffices();
  //   setState(() {
  //     _markers.clear();
  //     for (final office in googleOffices.offices) {
  //       final marker = Marker(
  //         markerId: MarkerId(office.name),
  //         position: LatLng(office.lat, office.lng),
  //         infoWindow: InfoWindow(
  //           title: office.name,
  //           snippet: office.address,
  //         ),
  //       );
  //       _markers[office.name] = marker;
  //     }
  //   });
  // }

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
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
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
          ),
          title: const Text("Resources"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      color: const Color(0xff381980),
                    ),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SAMHSA National Helpline",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.phone_rounded),
                                onPressed:
                                    launchSamshaP, //HELLO YOU NEED TO CHANGE THIS
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                              //SizedBox(width: 5),
                              IconButton(
                                icon: Icon(Icons.link_rounded),
                                onPressed: launchSamshaS,
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      color: const Color(0xff381980),
                    ),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "National Suicide Prevention Lifeline",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.phone_rounded),
                                onPressed: launchNSPLP,
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                              //SizedBox(width: 20),
                              IconButton(
                                icon: Icon(Icons.link_rounded),
                                onPressed: launchNSPLS,
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      color: const Color(0xff381980),
                    ),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NAMI Helpline",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.email_outlined),
                                onPressed: launchNamiE,
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                              //SizedBox(width: 20),
                              IconButton(
                                icon: Icon(Icons.phone_rounded),
                                onPressed: launchNamiP,
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                              //SizedBox(width: 20),
                              IconButton(
                                icon: Icon(Icons.link_rounded),
                                onPressed: launchNamiS,
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      color: const Color(0xff381980),
                    ),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Crisis Text Line",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.textsms_outlined),
                                onPressed: launchCrisisP,
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                              //SizedBox(width: 20),
                              IconButton(
                                icon: Icon(Icons.link_rounded),
                                onPressed: launchCrisisS,
                                iconSize: 25.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      color: const Color(0xff381980),
                    ),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "APA Crisis Resources",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.link_rounded),
                            onPressed: launchAPAS,
                            iconSize: 25.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Back button
      ),
    );
  }

  launchSamshaS() async {
    const url = 'https://www.samhsa.gov/find-treatment';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchSamshaP() async {
    const url = 'tel:+18006624357';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchNSPLS() async {
    const url = 'https://suicidepreventionlifeline.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchNSPLP() async {
    const url = 'tel:+18002738255';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchNamiS() async {
    const url = 'https://www.nami.org/help';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchNamiE() async {
    const url = 'mailto: info@nami.org'; //HEY RIGHT HERE CHANGE TO EMAIL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchNamiP() async {
    const url = 'tel:+18009506264';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchAPAS() async {
    const url = 'https://www.apa.org/topics/crisis-hotlines';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchCrisisS() async {
    const url = 'https://www.crisistextline.org/'; //for crisis home
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchCrisisP() async {
    const url = 'sms:+741741?body=HOME';
    //const url = 'sms:+15618279507?body=HOME';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
