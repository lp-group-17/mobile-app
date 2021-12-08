import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class test extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('testing'),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => FirebaseFirestore.instance.collection('testing').add({'timestamp': Timestamp.fromDate(DateTime.now())}),
          child: Icon(Icons.add),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('testing').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot,){
            if (!snapshot.hasData) return const SizedBox.shrink();
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index){
                final docData = snapshot.data!.docs[index].data();
                //final dateTime = (docData['timestamp'] as Timestamp).toDate();
                return ListTile(
                  title: Text(docData.toString()),
                );
              }
            );
          },
        ),
      ),
    );
  }
}