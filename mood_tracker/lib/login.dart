import 'package:flutter/material.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  Shader linearGradient = const LinearGradient(
    colors: [
      Colors.green,
      Colors.yellow,
    ],
  ).createShader(
    const Rect.fromLTWH(50.0, 0.0, 300.0, 70.0),
  );

  bool _passwordVisible = false;

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
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: Image.asset('assets/images/logo/logo.png',
                      fit: BoxFit.contain),
                ),
              ),
              Text(
                "Mood Tracker",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient,
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      enableSuggestions: true,
                      autocorrect: true,
                      decoration: const InputDecoration(
                          filled: true,
                          // fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Enter your username'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: !_passwordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          filled: true,
                          // fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          labelText: 'Enter your password'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: login,
                child: const SizedBox(
                  width: 300,
                  child: Center(
                    child: Text("Log In"),
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
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: signup,
                child: const SizedBox(
                  width: 300,
                  child: Center(
                    child: Text("Sign Up"),
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

  void login() {
    // TODO:  Check registration status
    //        If verified, goto home page
    //        If not verified, go to email verify page
  }
  void signup() {
    // TODO: Go to signup page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Signup(title: 'Signup'),
      ),
    );
  }
}
