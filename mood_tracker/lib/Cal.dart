import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'EventEdit.dart';

// ignore: prefer_const_constructors
class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(showAgenda: true),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.red,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const EventEditingPage()), //EventEditingPage()
        ),
      ),
    );
  }
}

class ToJournal extends StatelessWidget {
  const ToJournal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal goes here"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
