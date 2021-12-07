//import 'package:events_calendar_example/provider/event_provider.dart';
//import 'package:events_calendar_example/utils.dart';
import 'package:flutter/cupertino.dart';
import 'event.dart';

class EventProvider extends ChangeNotifier{
  final List<Event> _events = [];

  List<Event> get events => _events;

  void addEvent (Event event){
    _events.add(event);
    notifyListeners();
  }

  void deleteE(Event event){
    _events.remove(event);
    notifyListeners();
  }

  void editE(Event newE, Event oldE){
    final index = _events.indexOf(oldE);
    //_events[index] = newE;

    notifyListeners();
  }

}