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

  bool is8Chars = false;
  bool hasNum = false;
  bool hasUpper = false;
  bool hasLower = false;
  bool hasSymbol = false;
  bool isSame = false;
  String holdPass = "";
  String temp = "";

  final FNameController = TextEditingController();
  final LNameController = TextEditingController();
  final UsernameController = TextEditingController();
  final EmailController = TextEditingController();
  final PassController = TextEditingController();

  checkConfirm(String passConfirm){

    setState((){
      temp = passConfirm;
    isSame = false;
    if(passConfirm == holdPass){
      isSame = true;
    }
    });
  }

  checkPass(String password){
    // ignore: non_constant_identifier_names
    final TRegex = RegExp(r'[0-9]');
    // ignore: non_constant_identifier_names
    final TRegex2 = RegExp(r'[ A-Z]');
    // ignore: non_constant_identifier_names
    final TRegex3 = RegExp(r'[a-z]');
    // ignore: non_constant_identifier_names
    final TRegex4 = RegExp(r'^[a-zA-Z0-9]+$');


    setState((){
      holdPass = password;

      is8Chars = false;
      if(password.length >= 8){
        is8Chars = true;
      }

      hasNum = false;
      if(TRegex.hasMatch(password)){
        hasNum = true;
      }

      hasUpper = false;
      if(TRegex2.hasMatch(password)){
        hasUpper = true;
      }

      hasLower = false;
      if(TRegex3.hasMatch(password)){
        hasLower = true;
      }

      hasSymbol = false;
      if(TRegex4.hasMatch(password)){
        hasSymbol = false;
      }
      else{
        hasSymbol = true;
      }
    });
  }



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
                              onChanged: (password) => checkPass(password),
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
                              controller: PassController,
                            onChanged: (passwordConfirm) => checkConfirm(passwordConfirm),
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

  
    if (is8Chars == true && hasNum == true && hasUpper == true && hasLower == true && hasSymbol == true && isSame == true){
           Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Email(title: 'Email Verification'),
      ),
    );
                }

    else{
      print("testing");
      print(holdPass);
      print(temp);
      // MaterialButton(
      //   elevation: 5.0,
      //   child: Text("Ok"),
      //   onPressed: (){
      //     Navigator.of(context).pop();
      //   } ,);
      //PassController.
      //print(hasNum);

    }

  }
}
