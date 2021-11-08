import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  const Email({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Email> createState() => _Email();
}

class _Email extends State<Email> {
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
                "An email has been sent to\n"
                "placeholder@email.com\n" // TODO: change to variable and remove const
                "to verify your email and activate your account.\n"
                "If you did not receive the email,\n"
                "click the button below.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
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

  void resendEmail() {}
}
