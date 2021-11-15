import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'event.dart';
import 'EProvider.dart';
import 'package:flutter/material.dart';
import 'EventEdit.dart';

class EventView extends StatelessWidget {
  final Event event;

  const EventView({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          actions: buildView(context, event),
        flexibleSpace: Container(
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
        ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            buildDT(event),
            //const SizedBox(height: 40),
            Text(
              event.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              event.descrip,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      );

  Widget buildDT(Event event) {
    return Column(children: [
      buildD(event.allDay ? 'All Day' : 'From', event.from),
      const SizedBox(height: 20),
      if (!event.allDay) buildD('To', event.to), const SizedBox(height: 30),
    ]);
  }

  Widget buildD(String title, DateTime date) {
    if(title == 'All Day'){
      String frmtdate = DateFormat('EEEE, MMMM dd, y').format(date);
      return Container(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                frmtdate,
                style: const TextStyle(color: Colors.black, fontSize: 19),
              ),
            ),
          ],
        )
      );
    }
    String formattedDate = DateFormat('EEEE, MMMM dd, y  kk:mm').format(date);
    return Container(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                formattedDate,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),const SizedBox(width: 35), //This changes the format of how things appear on the left
          ],
        ));
  }

  List<Widget> buildView(BuildContext context, Event event) => [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => EventEditingPage(event: event),
            ),
          ),
        ),
        IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<EventProvider>(context, listen: false);
              provider.deleteE(event);
              Navigator.of(context).pop();
            }),
      ];
}
