import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  Shader linearGradient = const LinearGradient(
    colors: [
      Colors.green,
      Colors.yellow,
    ],
  ).createShader(
    const Rect.fromLTWH(50.0, 0.0, 300.0, 70.0),
  );

final _email = TextEditingController();
final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
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
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Image.asset(
                          'assets/images/passwordReset/passwordReset.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      "Forgot your Password?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Enter your email address below and\n"
                      "we'll send you an email with instructions\n"
                      "to reset your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        // foreground: Paint()..shader = linearGradient,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 330,
                      child: TextFormField(
                        enableSuggestions: true,
                        autocorrect: true,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        controller: _email,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          // fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff381980),
                                  ),
                                  onPressed: (){auth.sendPasswordResetEmail(email: _email.text);
                                  Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      //SizedBox(width: 10.0),
                                      Text(
                                        "Signup",
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
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void sendEmail() {
    
  }
}
