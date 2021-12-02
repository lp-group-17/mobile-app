import 'package:flutter/material.dart';
import 'HistoryModel.dart';

class HistDetails extends StatelessWidget {
  const HistDetails({Key? key, required this.historyModel}) : super(key: key);
  final HistoryModel historyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            // Colors.deepPurple,
            Colors.deepPurple,
            Colors.indigo,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(historyModel.title),
        elevation: 0,
        ),
        backgroundColor: Colors.transparent,
          //title: Text(historyModel.title),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(historyModel.descrip),
            Text('testing helloooo'),
            Text(historyModel.Q1.toString()),
            Text(historyModel.Q2.toString()),
            Text(historyModel.Q3.toString()),
            Text(historyModel.Q4.toString()),
            Text(historyModel.Q5.toString()),
          ],
        ),
      ),
    );
  }
}
