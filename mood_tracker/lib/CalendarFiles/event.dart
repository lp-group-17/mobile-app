import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mood_tracker/globals.dart' as globals;

// String jsonString = jsonEncode(user);
// Map<String, dynamic> userMap = jsonDecode(jsonString);
// var user = User.fromJson(userMap);

// Future<String> loadFromAssets() async {
//     return await rootBundle.loadString('json/parse.json');
//   }

//   loadYourData() async {
//     String jsonString = await loadFromAssets();
//     final yourDataModel = yourDataModelFromJson(jsonString);

//     for (int i = 0; i < yourDataModel.length; i++) {
//       if (yourDataModel[i].Q1 == 3) {
//         print('you got your id');
//         // Do your stuff
//       }
//     }
//   }
String jsonString = jsonEncode(user);
Map<String, dynamic> userMap = jsonDecode(jsonString);
var user = globals.User.fromJson(userMap);

class Event {
  final String user;
  final String title;
  final String descrip;
  final DateTime from;
  final DateTime to;
  final Color bgrClr;
  final bool allDay;

  Event({
    required this.user,
    required this.title,
    required this.descrip,
    required this.from,
    required this.to,
    this.bgrClr = Colors.lightGreen,
    this.allDay = false,
  });
// fromJson(Map<String, dynamic> json) =>{
//   String username = json['Username']
// };
  Map<String, dynamic> toJson() => {
        'User': user,
        'Title': title,
        'Descrip': descrip,
        'From': from.toIso8601String(),
        'To': to.toIso8601String(),
        'AllDay': allDay,
      };
}
