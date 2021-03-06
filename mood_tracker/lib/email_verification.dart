import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import '../test/testing.dart';

import 'api/apiHandler.dart';
import 'globals.dart' as globals;
import 'home.dart';

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

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
              Container(
                // margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 300,
                // alignment: A,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff381980),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        //SizedBox(width: 10.0),
                        Text(
                          "Resend Email",
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

  // void resendEmail() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => test(),
  //     ),
  //   );
  // }

  Future<void> checkEmailVerified() async {
    APIHandler api = APIHandler();

    await auth.currentUser!.reload();
    var isEmailVerified = auth.currentUser!.emailVerified;
    if (isEmailVerified) {
      timer.cancel();
      //firebase.auth().signOut();
      var response = await api.setVerification(globals.ID);

      if (response["error"] == "") {
        globals.verified = true;
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(title: 'Home'),
        ),
        (_) => false,
      );
      //print('it works'); verify email
    }
  }
}
