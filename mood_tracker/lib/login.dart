import 'package:flutter/material.dart';
import 'globals.dart';
import 'signup.dart';
import 'home.dart';
import 'forgot_password.dart';
import 'email_verification.dart';
import 'api/apiHandler.dart';
import 'package:dio/dio.dart';
import 'globals.dart' as globals;

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
            // Colors.deepPurple,
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
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        // fillColor: Colors.white,
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
                      // margin: EdgeInsets.only(top: 10),
                      height: 50,
                      // alignment: A,
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
                      // margin: EdgeInsets.only(top: 10),
                      height: 50,
                      // alignment: A,
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
    if (data["error"] == "") {
      globals.fname = data["User"]["Firstname"];
      globals.lname = data["User"]["Lastname"];
      globals.email = data["User"]["Email"];
      globals.ID = data["User"]["_id"];
      globals.username = data["User"]["Username"];
      globals.verified = data["User"]["Verified"];

      if (data["error"] == "User not found") {
        

      }

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
      print(data["error"]);
    }

    // TODO:  Check registration status
    //        If verified, goto home page
    //        If not verified, go to email verify page
  }

  // Future<User>? _futureUser;
  // FutureBuilder<User> buildFutureBuilder() {
  //   return FutureBuilder<User>(
  //     future: _futureUser,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Text(snapshot.data!.title);
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }

  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }

  void signup() {
    // TODO: Go to signup page
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
