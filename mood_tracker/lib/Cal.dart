import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// ignore: prefer_const_constructors
class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar goes here"),
      ),
      body:  SfCalendar(
      view: CalendarView.month,
      monthViewSettings: MonthViewSettings(showAgenda: true),
    )
      );
    
  }
}

