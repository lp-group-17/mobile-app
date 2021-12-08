//import 'dart:html';
import 'event.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/HistFiles/HistoryModel.dart';
import 'package:mood_tracker/api/apiHandler.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'EProvider.dart';
import 'EventEdit.dart';
import 'EventView.dart';
import 'EventsData.dart';
import 'package:mood_tracker/home_events.dart';
//import 'dart:html';

// ignore: prefer_const_constructors
class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  List<Event> eventss = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

//this is what you need for events/entries
  Future<void> loadData() async {
    APIHandler api = APIHandler();
    var data = await api.getEvents();
    eventss.clear();
    data["Events"].forEach((event) => {
          //data["Events"] change to entries for for questions. should just be able to be loaded into whatever it needs
          eventss.add(Event(
            user: event["User"],
            title: event["Title"],
            descrip: event["Descrip"],
            to: DateTime.parse(event["To"]),
            from: DateTime.parse(event["From"]),
            allDay: event["AllDay"],
          ))
        });

    setState(() {});
  }

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
          dataSource: EventsDataSource(eventss),
          view: CalendarView.month,
          //todayHighlightColor: Colors.indigo,
          //backgroundColor: Colors.purple,
          monthViewSettings: const MonthViewSettings(showAgenda: true),
          onTap: (details) {
            if (details.appointments == null) return;
            //if(details.appointments!.first == null) return;
            try {
              final event = details.appointments!.first;
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => EventView(event: event),
                ),
              )
                  .then((_) {
                loadData();
              });
            }
            // ignore: empty_catches
            catch (e) {}
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xff381980),
        onPressed: () => Navigator.of(context)
            .push(
          MaterialPageRoute(
              builder: (context) =>
                  const EventEditingPage()), //EventEditingPage()
        )
            .then((_) {
          loadData();
        }),
      ),
    );
  }
}
