//import 'package:events_calendar_example/provider/event_provider.dart';
//import 'package:events_calendar_example/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:mood_tracker/HistFiles/HistoryModel.dart';

class QProvider extends ChangeNotifier{
  final List<HistoryModel> _events = [];

  List<HistoryModel> get events => _events;

  void QaddEvent (HistoryModel event){
    _events.add(event);
    notifyListeners();
  }

  void deleteE(HistoryModel event){
    _events.remove(event);
    notifyListeners();
  }

  void editE(HistoryModel newE, HistoryModel oldE){
    final index = _events.indexOf(oldE);
    _events[index] = newE;

    notifyListeners();
  }

}