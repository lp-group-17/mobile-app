
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event.dart';

class Appointments extends CalendarDataSource{
  Appointments(List<Event> appointments){
    this.appointments = appointments;
  // ignore: non_constant_identifier_names
  
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index). from;

  @override
  DateTime getEndTime(int index) => getEvent(index). to;

  @override
  String getSubject(int index) => getEvent(index).title;

  bool allDay(int index) => getEvent(index).allDay;
}