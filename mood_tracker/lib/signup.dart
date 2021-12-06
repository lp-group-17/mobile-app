import 'package:flutter/material.dart';
import 'email_verification.dart';
import 'api/APIHandler.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
  Shader linearGradient = const LinearGradient(
    colors: [
      Colors.green,
      Colors.yellow,
    ],
  ).createShader(
    const Rect.fromLTWH(50.0, 0.0, 300.0, 70.0),
  );

  bool _passwordVisible = false;
  bool _passwordConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 100,
                        child: Image.asset('assets/images/logo/logo.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    enableSuggestions: true,
                                    autocorrect: true,
                                    decoration: const InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      filled: true,
                                      // fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      labelText: 'First Name',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    enableSuggestions: true,
                                    autocorrect: true,
                                    decoration: const InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      filled: true,
                                      // fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      labelText: 'Last Name',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: const InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                filled: true,
                                // fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              enableSuggestions: true,
                              autocorrect: true,
                              decoration: const InputDecoration(
                                enabledBorder: const OutlineInputBorder(
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
                            const SizedBox(height: 10),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              obscureText: !_passwordVisible,
                              enableSuggestions: false,
                              autocorrect: false,
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
                                // fillColor: Colors.white,
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              obscureText: !_passwordConfirmVisible,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordConfirmVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordConfirmVisible =
                                          !_passwordConfirmVisible;
                                    });
                                  },
                                ),
                                filled: true,
                                // fillColor: Colors.white,
                                border: const OutlineInputBorder(),
                                labelText: 'Comfirm password',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              // margin: EdgeInsets.only(top: 10),
                              height: 50,
                              // alignment: A,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
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
                          ],
                        ),
                      ),

                      // ElevatedButton(
                      //   onPressed: signup,
                      //   child: const SizedBox(
                      //     width: 300,
                      //     child: Center(
                      //       child: Text("Submit"),
                      //     ),
                      //   ),
                      //   style: ButtonStyle(
                      //     shape:
                      //         MaterialStateProperty.all<RoundedRectangleBorder>(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(18.0),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            // Back button
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
      ),
    );
  }

  void signup() {
    // TODO: submit form and goto email verification page

    // APIHandler api = APIHandler();
    // api.signup();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Email(title: 'Email Verification'),
      ),
    );
  }
}
