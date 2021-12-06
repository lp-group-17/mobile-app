import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'HistoryModel.dart';

class Appointments extends CalendarDataSource {
  Appointments(List<HistoryModel> appointments) {
    this.appointments = appointments;
    // ignore: non_constant_identifier_names
  }

  HistoryModel getEvent(int index) => appointments![index] as HistoryModel;

  double getQ1(int index) => getEvent(index).Q1;
  double getQ2(int index) => getEvent(index).Q2;
  double getQ3(int index) => getEvent(index).Q3;
  double getQ4(int index) => getEvent(index).Q4;
  //double getQ5(int index) => getEvent(index).Q5;

  @override
  String getSubject(int index) => getEvent(index).date.toString();

  String getDescrip(int index) => getEvent(index).descrip;
}
