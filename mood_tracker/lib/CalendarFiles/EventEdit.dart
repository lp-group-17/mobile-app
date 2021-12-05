// import 'package:events_calendar_example/provider/event_provider.dart';
//import 'package:events_calendar_example/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event.dart';
import 'Getters.dart';
import 'EProvider.dart';
import 'package:mood_tracker/api/apiHandler.dart';
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
  final deetsControl = TextEditingController();
  late bool isChecked = false;

  @override
  // ignore: override_on_non_overriding_member
  void init() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(
        const Duration(hours: 3),
      );
    } else {
      final event = widget.event!;
      titleControl.text = event.title;
      deetsControl.text = event.descrip;
      fromDate = event.from;
      isChecked = event.allDay;
      toDate = event.to;
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
                buildBox(), //these 2 lines need to save their input to the actual data list n stuff
                buildDeets(),
                // const TextField(
                //   decoration: InputDecoration(
                //     border: UnderlineInputBorder(),
                //     hintText: 'Details....',
                //   ),
                //   keyboardType: TextInputType.multiline,
                //   maxLines: null,
                // )
              ],
            ),
          ),
        ),
      );
  Widget buildDeets() => TextFormField(
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Details...',
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onFieldSubmitted: (_) {}, //can add save here
        controller: deetsControl,
      );

  Widget buildBox() {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        return Center(
          child: CheckboxListTile(
            title: const Text("All Day Event"),
            controlAffinity: ListTileControlAffinity.platform,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
            activeColor: Colors.blue,
            checkColor: Colors.white,
          ),
        );
      },
    );
  }

  List<Widget> doAddBut() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: save,
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
                onClick: () => pickFromDate(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropDown(
                text: Getters.toTime(fromDate),
                onClick: () => pickFromDate(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Widget buildTo() => buildHead(
        header: 'TO',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropDown(
                text: Getters.toDate(toDate),
                onClick: () => pickToDate(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropDown(
                text: Getters.toTime(toDate),
                onClick: () => pickToDate(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Future pickToDate({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);

    if (date == null) return;
    setState(() => toDate = date);
  }

  Future pickFromDate({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future<DateTime?> pickDateTime(DateTime initialDate,
      {required bool pickDate, DateTime? firstDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2000, 1),
        lastDate: DateTime(2100),
      );

      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final dayTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (dayTime == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: dayTime.hour, minutes: dayTime.minute);

      return date.add(time);
    }
  }

  Widget buildTitle() => TextFormField(
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Add Title',
        ),
        onFieldSubmitted: (_) {}, //can add save here
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

  Future save() async {
    final isValid = _forming.currentState!.validate();

    if (isValid) {
      final event = Event(
        title: titleControl.text,
        descrip: deetsControl.text,
        from: fromDate,
        to: toDate,
        allDay: isChecked,
      );
      final isEdit = widget.event != null;
      final provider = Provider.of<EventProvider>(context, listen: false);
      if (isEdit) {
        provider.editE(event, widget.event!);
        Navigator.of(context).pop();
      } else {
        provider.addEvent(event);
        Navigator.of(context).pop();
      }

      APIHandler api = APIHandler();
      api.addEvent(event.toJson());
    }
  }
}
