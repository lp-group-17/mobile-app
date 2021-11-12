// import 'package:events_calendar_example/provider/event_provider.dart';
//import 'package:events_calendar_example/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event.dart';
import 'Getters.dart';
//import 'package:ntp/ntp.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;

  const EventEditingPage({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  late DateTime fromDate = DateTime.now();
  late DateTime toDate = DateTime.now().add(const Duration(hours: 3));
  final _forming = GlobalKey<FormState>();
  final titleControl = TextEditingController();

  @override
  void init() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(
        const Duration(hours: 3),
      );
    }
  }

  void yeetIt() {
    //dispose method
    titleControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          actions: doAddBut(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _forming,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle(),
                const SizedBox(height: 12),
                buildDateTime(),
              ],
            ),
          ),
        ),
      );

  List<Widget> doAddBut() => [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.done),
          label: const Text('ADD'),
        )
      ];

  Widget buildDateTime() => Column(
        children: [
          buildFrom(),
          buildTo(),
        ],
      );

  Widget buildFrom() => buildHead(
      header: 'FROM',
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropDown(
              text: Getters.toDate(fromDate),
              onClick: () {},
            ),
          ),
          Expanded(
            child: buildDropDown(
              text: Getters.toTime(fromDate),
              onClick: () {},
            ),
          )
        ],
      ),);

      Widget buildTo() => buildHead(
      header: 'TO',
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropDown(
              text: Getters.toDate(toDate),
              onClick: () {},
            ),
          ),
          Expanded(
            child: buildDropDown(
              text: Getters.toTime(toDate),
              onClick: () {},
            ),
          )
        ],
      ));

  Widget buildTitle() => TextFormField(
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Add Title',
        ),
        onFieldSubmitted: (_) {},
        validator: (title) =>
            title != null && title.isEmpty ? 'Please add a title' : null,
        controller: titleControl,
      );

  Widget buildHead({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: const TextStyle(fontWeight: FontWeight.bold)),
          child,
        ],
      );

  Widget buildDropDown({
    required String text,
    required VoidCallback onClick,
  }) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClick,
      );
}
