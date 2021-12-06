import 'package:flutter/material.dart';
import 'package:mood_tracker/HistFiles/HistoryModel.dart';
import 'package:mood_tracker/api/apiHandler.dart';
import 'package:provider/provider.dart';
import 'QProvider.dart';
import 'package:mood_tracker/globals.dart' as globals;

class Questions extends StatefulWidget {
  const Questions({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Questions createState() => _Questions();
}

Shader linearGradient = const LinearGradient(
  colors: [
    Colors.green,
    Colors.yellow,
  ],
).createShader(
  const Rect.fromLTWH(50.0, 0.0, 300.0, 70.0),
);

// ignore: non_constant_identifier_names
double Q1rating = 3;
// ignore: non_constant_identifier_names
double Q2rating = 3;
// ignore: non_constant_identifier_names
double Q3rating = 3;
// ignore: non_constant_identifier_names
double Q4rating = 3;
// ignore: non_constant_identifier_names
double Q5rating = 3;

class _Questions extends State<Questions> {
  final deetsControl = TextEditingController();
  final titleControl = TextEditingController();
  late DateTime Time = DateTime.now();
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
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            //buildDT(event),
            //const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //const SizedBox(height: 10),
                const Text(
                  "How has your mood been today?",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q1rating,
                  min: 1,
                  max: 5,
                  onChanged: (newRating) {
                    setState(() => Q1rating = newRating);
                  },
                  divisions: 4,
                  label: "$Q1rating",
                ),
                const SizedBox(height: 50),
                const Text(
                  "How has your anxiety level been today?", //Q2
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q2rating,
                  min: 1,
                  max: 5,
                  onChanged: (newRating) {
                    setState(() => Q2rating = newRating);
                  },
                  divisions: 4,
                  label: "$Q2rating",
                ),
                const SizedBox(height: 50),
                const Text(
                  "How has your irritability level been today?", //Q3
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q3rating,
                  min: 1,
                  max: 5,
                  onChanged: (newRating) {
                    setState(() => Q3rating = newRating);
                  },
                  divisions: 4,
                  label: "$Q3rating",
                ),
                const SizedBox(height: 50),
                const Text(
                  "How would you rate your ability to focus today?", //Q4
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q4rating,
                  min: 1,
                  max: 5,
                  onChanged: (newRating) {
                    setState(() => Q4rating = newRating);
                  },
                  divisions: 4,
                  label: "$Q4rating",
                ),
                const SizedBox(height: 50),
                const Text(
                  "How would you rate the day overall?", //Q5
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q5rating,
                  min: 1,
                  max: 5,
                  onChanged: (newRating) {
                    setState(() => Q5rating = newRating);
                  },
                  divisions: 4,
                  label: "$Q5rating",
                ),
                const SizedBox(height: 50),
                buildDeets(),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const Text('Finished'),
                  onPressed: () {
                    save;
                    Navigator.pop(context);
                  }, //edit to save the information and send it through api or w/e/ do save
                ),
              ],
            ),
          ],
        ),
      ),
    );
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

  Widget buildDeets() => TextFormField(
        style: const TextStyle(fontSize: 24, color: Colors.white),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Tell us about your day',
          hintStyle: TextStyle(color: Colors.grey),
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onFieldSubmitted: (_) {}, //can add save here
        controller: deetsControl,
      );

  // TODO: fix this, no idea whats wrong, but doesn't work. Won't post and won't print with debug statement
  Future save() async {
    final event = HistoryModel(
      title: Time.toString(),
      descrip: deetsControl.text,
      Q1: Q1rating,
      Q2: Q2rating,
      Q3: Q3rating,
      Q4: Q4rating,
    );

    APIHandler api = APIHandler();
    api.addEntry(event.toJson());

    // final isEdit = widget.event != null;
    final provider = Provider.of<QProvider>(context, listen: false);
    // if (isEdit) {
    //   provider.editE(event, widget.event!);
    //   Navigator.of(context).pop();
    // } else {
    provider.QaddEvent(event);
    //   Navigator.of(context).pop();
    // }
  }
}
