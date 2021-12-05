//import 'package:events_calendar_example/provider/event_provider.dart';
//import 'package:events_calendar_example/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:mood_tracker/HistFiles/HistoryModel.dart';

class QProvider extends ChangeNotifier{
  final List<HistoryModel> _entries = [];

  List<HistoryModel> get events => _entries;

  void QaddEvent (HistoryModel entry){
    _entries.add(entry);
    notifyListeners();
  }

  void deleteE(HistoryModel entry){
    _entries.remove(entry);
    notifyListeners();
  }

  void editE(HistoryModel newE, HistoryModel oldE){
    final index = _entries.indexOf(oldE);
    _entries[index] = newE;

    notifyListeners();
  }

  List<HistoryModel> getList(){
      return _entries;
}

}