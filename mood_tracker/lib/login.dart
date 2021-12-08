import 'package:flutter/material.dart';
import 'globals.dart';
import 'signup.dart';
import 'home.dart';
import 'forgot_password.dart';
import 'email_verification.dart';
import 'api/apiHandler.dart';
import 'package:dio/dio.dart';
import 'globals.dart' as globals;
import 'package:crypto/crypto.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  bool isNotFound = true;
  bool UsernameValidate = false;
  bool PassValidate = false;

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
                  child: Image.asset(
                    'assets/images/logo/logo.png',
                    fit: BoxFit.contain,
                  ),
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
                      controller: loginIDController,
                      enableSuggestions: true,
                      autocorrect: true,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        errorText: UsernameValidate ? '' : null,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Enter your username',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        errorText: PassValidate
                            ? 'Username/Password is Incorrect'
                            : null,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Enter your password',
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // SizedBox(height: 5),
                    Container(
                      alignment: Alignment.topRight,
                      height: 40,
                      child: TextButton(
                        onPressed: forgotPassword,
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff381980),
                          ),
                          onPressed: login,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 10.0),
                              Text(
                                "Login",
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
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff381980),
                          ),
                          onPressed: signup,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 10.0),
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
                    SizedBox(height: 5)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController loginIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    APIHandler api = APIHandler();
    var data = await api.login(loginIDController.text, passwordController.text);
    // var data = response.data;

    setState(() {
      loginIDController.text.isEmpty || isNotFound == true
          ? UsernameValidate = true
          : UsernameValidate = false;
      passwordController.text.isEmpty || isNotFound == true
          ? PassValidate = true
          : PassValidate = false;
    });

    // If user is found
    if (data["error"] == "") {
      // Set global variable to user
      globals.fname = data["User"]["Firstname"];
      globals.lname = data["User"]["Lastname"];
      globals.email = data["User"]["Email"];
      globals.ID = data["User"]["_id"];
      globals.username = data["User"]["Username"];
      globals.verified = data["User"]["Verified"];

      // If user is verified, push home page, if not, push verification page
      if (globals.verified) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(title: 'Home'),
          ),
          (_) => false,
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Email(title: 'Email Verification'),
          ),
        );
      }
    } else {
      // User is not found set borders to red
      setState(() {
        isNotFound = true;
        UsernameValidate = true;
        PassValidate = true;
      });
    }

    // if (data["error"] == "") {
    //   // setState(() {
    //   //   isNotFound = false;
    //   //   loginIDController.text.isEmpty
    //   //       ? UsernameValidate = true
    //   //       : UsernameValidate = false;
    //   //   passwordController.text.isEmpty
    //   //       ? PassValidate = true
    //   //       : PassValidate = false;
    //   // });
    //   globals.fname = data["User"]["Firstname"];
    //   globals.lname = data["User"]["Lastname"];
    //   globals.email = data["User"]["Email"];
    //   globals.ID = data["User"]["_id"];
    //   globals.username = data["User"]["Username"];
    //   globals.verified = data["User"]["Verified"];

    //   // isNotFound = true;
    //   // if (data["error"] == "User not found") {
    //   //   //print('do we get in error change state');
    //   //   isNotFound = false;
    //   // }
    //   //CloginIDController.text == loginIDController.text;

    //   // if (UsernameValidate == false && PassValidate == false) {
    //   //   print("do we get here?");

    //   if (globals.verified) {
    //     Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const Home(title: 'Home'),
    //       ),
    //       (_) => false,
    //     );
    //   } else {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const Email(title: 'Email Verification'),
    //       ),
    //     );
    //   }
    // } else {
    //   print(data["error"]);
    //   //   }
    //   // } else {
    //   //only error is the one user not found so come here if there's an error

    //   //isNotFound = true;
    //   setState(() {
    //     isNotFound = true;
    //     UsernameValidate = true;
    //     PassValidate = true;
    //   });
    // }
  }

  void signup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Signup(title: 'Signup'),
      ),
    );
  }

  void forgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotPassword(title: 'Forgot Password'),
      ),
    );
  }
}
