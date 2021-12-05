import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'login.dart';
import 'CalendarFiles/cal.dart';
import 'QuestFiles/Questions.dart';
import 'HistFiles/History.dart';
import 'BarChart/bar_chart_data.dart';
import 'BarChart/mood_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String averagePeriod = '1 week';

  Shader linearGradient = const LinearGradient(
    colors: [
      Colors.green,
      Colors.yellow,
    ],
  ).createShader(
    const Rect.fromLTWH(50.0, 0.0, 300.0, 70.0),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            // Colors.deepPurple,
            // Colors.deepPurple,
            // Colors.indigo,
            Colors.greenAccent,
            Colors.blue,
            // Color(0xFF5AA7A7),
            // Color(0xFF6C8CBF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),

                // Welcome user and logout button
                // Expanded(
                //   flex: 1,
                // child:
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome, <USER>",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: logout,
                          label: const Icon(Icons.logout_rounded),
                          icon: const Text("Logout"),
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          // height: 20,
                          alignment: Alignment.bottomLeft,
                          // padding: const EdgeInsets.only(left: 10, top: 10),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Average",
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(width: 20),
                              DropdownButton<String>(
                                value: averagePeriod,
                                items: <String>[
                                  '1 week',
                                  '1 month',
                                  '6 months',
                                  '1 year',
                                  'All time'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    averagePeriod = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          // child: const SizedBox(
                          // // width: 356,
                          // height: 250,
                          child: MoodChart(data: [1, 2, 3, 4]),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // New entry and journal
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        // width: 165,
                        height: 70,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          child: ElevatedButton(
                            onPressed: openQuestions,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add_box_rounded,
                                  size: 30.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                    // width: 10.0,
                                    ),
                                Text(
                                  "New Entry",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: SizedBox(
                        height: 70,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          child: ElevatedButton(
                            onPressed: openHistory,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.history_edu_rounded,
                                  size: 30.0,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "History",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),

                // Calendar
                Expanded(
                  child: SizedBox(
                    // width: 350,
                    // height: 250,
                    child: Material(
                      // <----------------------------- Outer Material
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Material(
                          // <------------------------- Inner Material
                          type: MaterialType.transparency,
                          child: InkWell(
                            //<------------------------- InkWell
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            // splashColor: Colors.white10,
                            onTap: openCalendar,
                            child: Column(
                              children: [
                                Container(
                                  // height: 20,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 5),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.calendar_today_rounded,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        "Calendar",
                                        style: TextStyle(
                                            fontSize: 28, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    border: Border.all(color: Colors.white),
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Container(
                                  // height: 20,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    border: Border.symmetric(
                                      vertical: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  child: const Text(
                                    "Today's Agenda:",
                                    // DateFormat('EEEE, d MMMM yyyy')
                                    //     .format(DateTime.now())
                                    //     .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  // // width: 350,
                                  // height: 225,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),

                                    // padding:
                                    //     const EdgeInsets.fromLTRB(12.5, 0, 25, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: SfCalendar(
                                        backgroundColor: Colors.white10,
                                        headerHeight: 0,
                                        allowViewNavigation: false,
                                        view: CalendarView.schedule,
                                        minDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month,
                                            DateTime.now().day,
                                            0,
                                            0,
                                            0),
                                        maxDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month,
                                            DateTime.now().day + 1,
                                            0,
                                            0,
                                            0),
                                        scheduleViewSettings:
                                            const ScheduleViewSettings(
                                          weekHeaderSettings:
                                              WeekHeaderSettings(
                                            height: 0,
                                          ),
                                          dayHeaderSettings: DayHeaderSettings(
                                            dayFormat: 'EEEE',
                                            width: 0,
                                            dayTextStyle: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.red,
                                            ),
                                            dateTextStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.red,
                                            ),
                                          ),
                                          appointmentItemHeight: 30,
                                          hideEmptyScheduleWeek: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),

                // Resources
                SizedBox(
                  // width: 350,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.library_books_rounded,
                            size: 40.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                              // width: 10.0,
                              ),
                          Text(
                            "Resources",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // const SizedBox(height: 10),
                // const Expanded(
                //   flex: 1,
                //   child: SizedBox(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logout() {
    // TODO:  delete token
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(title: 'Login'),
      ),
      (_) => false,
    );
  }

  void openCalendar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CalendarPage(title: 'Calendar'),
      ),
    );
  }

  void openQuestions() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Questions(title: 'Questions'),
      ),
    );
  }

  void openHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const History(title: 'History'),
      ),
    );
  }
}
