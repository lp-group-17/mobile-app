// ignore_for_file: non_constant_identifier_names

class HistoryModel {
  final String title; 
  final String descrip;
  final double Q1;
  final double Q2;
  final double Q3;
  final double Q4;
  final double Q5;

  const HistoryModel({
      required this.title, 
     required this.descrip, 
     required this.Q1, 
     required this.Q2, 
     required this.Q3, 
     required this.Q4, 
     required this.Q5});

     Map<String, dynamic> toJson() => 
  {
    //'User': user,
    'Title': title,
    'Descrip': descrip,
    'Q1': Q1,
    'Q2': Q2,
    'Q3': Q3,
    'Q4': Q4,
    'Q5': Q5,
  };
}
