import 'package:flutter/material.dart';

class Event {
final String title;
final String descrip;
final DateTime from;
final DateTime to;
final Color bgrClr;
final bool allDay;

const Event ({
  required this.title,
  required this.descrip,
  required this.from,
  required this.to,
  this.bgrClr = Colors.lightGreen,
  this.allDay = false,
});

}