import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:mood_tracker/api/testing.dart';

import 'api/apiHandler.dart';
import 'globals.dart' as globals;

class Email extends StatefulWidget {
  const Email({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Email> createState() => _Email();
}

class _Email extends State<Email> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  Shader linearGradient = const LinearGradient(
    colors: [
      Colors.green,
      Colors.yellow,
    ],
  ).createShader(
    const Rect.fromLTWH(50.0, 0.0, 300.0, 70.0),
  );

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer){
      checkEmailVerified();
    });

    super.initState();
    checkVerification();
  }

  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }

//this is what you need for events/entries
  Future<void> checkVerification() async {
    APIHandler api = APIHandler();

    Timer.periodic(Duration(seconds: 5), (timer) async {
      var isVerified = await api.checkVerification(globals.ID);
    });
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
            Colors.deepPurple,
            Colors.indigo,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: Image.asset('assets/images/email/email.png',
                      fit: BoxFit.contain),
                ),
              ),
              Text(
                "Verify your email",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient,
                ),
              ),
              const Text(
                "We sent you an email to verify\n"
                "your email address.\n" // TODO: change to variable and remove const
                "Please follow the intructions to\n"
                "activate your account.\n\n"
                "If you did not receive an email,\n"
                "click the button below to send another.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  // foreground: Paint()..shader = linearGradient,
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: resendEmail,
                child: const SizedBox(
                  width: 300,
                  child: Center(
                    child: Text("Resend Email"),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: Wait for verification then use the following
  //   Navigator.pushAndRemoveUntil(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => const Home(title: 'Home'),
  //   ),
  //   (_) => false,
  // );

  void resendEmail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => test(),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      print('it works');
    }
  }
}
