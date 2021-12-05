import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mood_tracker/globals.dart';

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
var user = User.fromJson(userMap);
class Event {
final String title;
final String descrip;
final DateTime from;
final DateTime to;
final Color bgrClr;
final bool allDay;

 Event ({
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
Map<String, dynamic> toJson() => 
  {
    'User': user.username,
    'Title': title,
    'Descrip': descrip,
    'From': from,
    'To': to,
    'AllDay': allDay,
  };
}