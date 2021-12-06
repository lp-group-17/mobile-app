import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'CalendarFiles/event.dart';

class EventsDataSource extends CalendarDataSource {
  EventsDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  String getDescrip(int index) {
    return appointments![index].descrip;
  }

  @override
  Color getColor(int index) {
    return Colors.orange.shade900;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].allDay;
  }
}
