import 'package:flutter/material.dart';

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
                const SizedBox(height: 20),
                const Text(
                  "How has your mood been today?",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q1rating,
                  min:1,
                  max: 5,
                  onChanged: (newRating){
                    setState(() => Q1rating = newRating);
                  },
                  divisions: 4,
                  label:"$Q1rating",
                ),
                const SizedBox(height: 50),
                const Text(
                  "How has your anxiety level been today?",  //Q2
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q2rating,
                  min:1,
                  max: 5,
                  onChanged: (newRating){
                    setState(() => Q2rating = newRating);
                  },
                  divisions: 4,
                  label:"$Q2rating",
                ),
                const SizedBox(height: 50),
                const Text(
                  "How has your anxiety level been today?", //Q3
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q3rating,
                  min:1,
                  max: 5,
                  onChanged: (newRating){
                    setState(() => Q3rating = newRating);
                  },
                  divisions: 4,
                  label:"$Q3rating",
                ),
                const SizedBox(height: 50),
                const Text(
                  "How has your anxiety level been today?", //Q4
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q4rating,
                  min:1,
                  max: 5,
                  onChanged: (newRating){
                    setState(() => Q4rating = newRating);
                  },
                  divisions: 4,
                  label:"$Q4rating",
                ),
                const SizedBox(height: 50),
                const Text(
                  "How has your anxiety level been today?", //Q5
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Slider(
                  value: Q5rating,
                  min:1,
                  max: 5,
                  onChanged: (newRating){
                    setState(() => Q5rating = newRating);
                  },
                  divisions: 4,
                  label:"$Q5rating",
                ),
                const SizedBox(height: 50),
                buildDeets(),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const Text('Finished'),
                  onPressed:() {Navigator.pop(context);}, //edit to save the information and send it through api or w/e
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
}
