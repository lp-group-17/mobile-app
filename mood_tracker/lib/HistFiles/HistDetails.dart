import 'package:flutter/material.dart';
import 'HistoryModel.dart';
import 'package:mood_tracker/BarChart/bar_chart_data.dart';

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

        body: ListView(
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            //buildDT(event),
            //const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                const SizedBox(height: 20),
                     Text(historyModel.descrip,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                    const SizedBox(height: 20),
                     Text(historyModel.Q1.toString(),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                    const SizedBox(height: 20),
                     Text(historyModel.Q2.toString(),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                    const SizedBox(height: 20),
                     Text(historyModel.Q3.toString(),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                    const SizedBox(height: 20),
                     Text(historyModel.Q4.toString(),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                    const SizedBox(height: 20),
                     Text(historyModel.Q5.toString(),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
            
            
            // Text('testing helloooo'),
            // Text(historyModel.Q1.toString()),
            // Text(historyModel.Q2.toString()),
            // Text(historyModel.Q3.toString()),
            // Text(historyModel.Q4.toString()),
            // Text(historyModel.Q5.toString()),
            ],),
                    
          ],
        ),
      ),
    );
  }
}
