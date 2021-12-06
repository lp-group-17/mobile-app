// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:mood_tracker/QuestFiles/Questions.dart';
import 'package:provider/provider.dart';
import 'HistDetails.dart';
import 'HistoryModel.dart';
import 'ListEdit.dart';
import 'QData.dart';
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
static List<String> Titles = ['11/27','11/28','11/29','11/30','12/1'];
// ignore: non_constant_identifier_names
final List<HistoryModel> Data = List.generate(Titles.length, (index) => HistoryModel(
  title: Titles[index],
        descrip: 'I had a pretty good day today :)',
        Q1: 5,
        Q2: 1,
        Q3: 2,
        Q4: 4,
        //Q5: 1.0,
        ));
  
  

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
        ),
        backgroundColor: Colors.transparent,
        body: AnimatedList(
          
          key: ListKey,
          initialItemCount: Titles.length,
          itemBuilder: (context,index,animation) => ListEdit(
            item: Data[index],
            animation:animation,
            onClicked: () => removeItem(index),
            onClicked2: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistDetails(historyModel:Data[index],)));},
            //onClicked2: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistDetails(historyModel:Data[index],)));},
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                         builder: (context) => const Questions(title: 'Questionnaire'),
                  ),
                );},),
      ),);
  }

// void insertItem(){
//   final newIndex = 1;
//   final newData = 
// }
  void removeItem(int index){
    // ignore: non_constant_identifier_names
    final RemovedItem = Data[index];
    Data.removeAt(index);
    ListKey.currentState !.removeItem(
      index, (context, animation) => ListEdit(item: RemovedItem, animation: animation, onClicked: () {},onClicked2: () {}),
    );
  }

}
