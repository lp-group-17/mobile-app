import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'EProvider.dart';
import 'EventEdit.dart';
import 'EventView.dart';
import 'EventsData.dart';

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
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
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
        title: const Text("Calendar"),
        //backgroundColor: Colors.deepPurple.shade400,
      ),
      body: SfCalendar(
          dataSource: Appointments(events),
          view: CalendarView.month,
          //todayHighlightColor: Colors.indigo,
          //backgroundColor: Colors.purple,
          monthViewSettings: const MonthViewSettings(showAgenda: true),
          onTap: (details) {
            if (details.appointments == null) return;
            //if(details.appointments!.first == null) return;
            try {
              final event = details.appointments!.first;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventView(event: event),
              ),);
            }
            // ignore: empty_catches
            catch (e) {}
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.indigo,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  const EventEditingPage()), //EventEditingPage()
        ),
      ),
    );
  }
  
}

