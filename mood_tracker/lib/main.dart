import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'email_verification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Home';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: Home(title: appTitle),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150.0,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
            ),
            ListTile(
              title: const Text('Calendar'), //includes medication and frequency
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToCalendar()));
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Journal'),
              onTap: () {
                // Update the state of the app
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ToJournal()));
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Expenses/Mood History'),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToExpenses()));
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Questionnaire'),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToQuestionnaire()));
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Resources'), //includes journal entry fill out
              onTap: () {
                // Update the state of the app
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToResources()));
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                  'Test Login Page'), //includes journal entry fill out
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(title: 'Log In'),
                  ),
                );
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                  'Test Signup Page'), //includes journal entry fill out
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Signup(title: 'Sign Up'),
                  ),
                );
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                  'Test Email Page'), //includes journal entry fill out
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Email(title: 'Email'),
                  ),
                );
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ToJournal extends StatelessWidget {
  const ToJournal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal goes here"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class ToCalendar extends StatelessWidget {
  const ToCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar goes here"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class ToExpenses extends StatelessWidget {
  const ToExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses goes here"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class ToResources extends StatelessWidget {
  const ToResources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resources goes here"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class ToQuestionnaire extends StatelessWidget {
  const ToQuestionnaire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questionnaire goes here"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
