// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:mood_tracker/QuestFiles/Questions.dart';
import 'package:mood_tracker/api/apiHandler.dart';
import 'package:provider/provider.dart';
import 'HistDetails.dart';
import 'HistoryModel.dart';
import 'ListEdit.dart';
import 'QData.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/QuestFiles/QProvider.dart';

class History extends StatefulWidget {
  const History({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _History createState() => _History();
}

class _History extends State<History> {
  final ListKey = GlobalKey<AnimatedListState>();
// ignore: non_constant_identifier_names
  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<HistoryModel> entries = [];
  int count = 0;

//this is what you need for events/entries
  Future<void> loadData() async {
    APIHandler api = APIHandler();
    entries.clear();

    var data = await api.getEntries();
    entries.clear();
    data["Entries"].forEach((entry) => {
          entries.add(HistoryModel(
            date: DateTime.parse(entry["Date"]),
            descrip: entry["Descrip"],
            Q1: entry["Q1"].toDouble(),
            Q2: entry["Q2"].toDouble(),
            Q3: entry["Q3"].toDouble(),
            Q4: entry["Q4"].toDouble(),
          )),
        });

    count = entries.length;
    print(entries);
    setState(() {}); //tells page to refresh widget when you get data
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurple,
            Colors.indigo,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[         
          TextButton.icon(
            icon: Icon(Icons.add, color: Colors.white, ),
            label: const Text("Add Entry", 
            style: TextStyle(fontSize: 20,
            color: Colors.white)),
            //tooltip: 'Go to the next page',
            onPressed: () {
              test;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Questions(title: 'Questionnaire'),
              ),
            );
            },
          ),
        ],
        ),
        backgroundColor: Colors.transparent,
        body: ListView.builder(
            reverse: true,
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final item = entries[index];
              String frmtdate = DateFormat('M/d, y').format(item.date);

              return Card(
                child: ListTile(
                  title: Text(frmtdate),
                  trailing: Row(
                    mainAxisSize:MainAxisSize.min, // space between two icons
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      IconButton(
                        icon:Icon(Icons.delete, color: Colors.red), 
                        onPressed: (){removeItem(index);}),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistDetails(historyModel: entries[index]))).then((_) {loadData();});
                          },
                        ),  // icon-1
                       // icon-2
                    ],
                  ),
                ),
              );
            }),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
          
        //   onPressed: () {
        //     test;
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const Questions(title: 'Questionnaire'),
        //       ),
        //     );
        //   },
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }

// void insertItem(){
//   final newIndex = 1;
//   final newData =
// }

  void test() {
    print("testing");
    final t = 1;
    final nT = (List.of(entries).first);

    entries.insert(t, nT);
    ListKey.currentState!.insertItem(
      t,
      duration: Duration(milliseconds: 600),
    );
  }

  void removeItem(int index) {
    // ignore: non_constant_identifier_names
    final RemovedItem = entries[index];
    entries.removeAt(index);
    // ListKey.currentState!.removeItem(
    //   index,
    //   (context, animation) => ListEdit(
    //       item: RemovedItem,
    //       animation: animation,
    //       onClicked: () {},
    //       onClicked2: () {}),
    // );
  }
}
