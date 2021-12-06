
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'HistoryModel.dart';

class Appointments extends CalendarDataSource{
  Appointments(List<HistoryModel> appointments){
    this.appointments = appointments;
  // ignore: non_constant_identifier_names
  
  }

  HistoryModel getEvent(int index) => appointments![index] as HistoryModel;

  int getQ1(int index) => getEvent(index).Q1;
  int getQ2(int index) => getEvent(index).Q2;
  int getQ3(int index) => getEvent(index).Q3;
  int getQ4(int index) => getEvent(index).Q4;
  //double getQ5(int index) => getEvent(index).Q5;

  @override
  String getSubject(int index) => getEvent(index).title;

  String getDescrip(int index) => getEvent(index).descrip;

  
}