import 'package:flutter/material.dart';
import 'email_verification.dart';
import 'api/APIHandler.dart';
import 'globals.dart' as globals;
import 'home.dart';

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
  bool weGucci = true;
  bool UserTaken = false;
  bool EmailTaken = false;

  final FNameController = TextEditingController();
  final LNameController = TextEditingController();
  final UsernameController = TextEditingController();
  final EmailController = TextEditingController();
  final PassController = TextEditingController();
  final PCController = TextEditingController();
  bool FNameValidate = false;
  bool LNameValidate = false;
  bool UsernameValidate = false;
  bool EmailValidate = false;
  bool PassValidate = false;
  bool PCValidate = false;

  checkConfirm(String passConfirm) {
    setState(() {
      temp = passConfirm;
      isSame = false;
      if (passConfirm == holdPass) {
        isSame = true;
      }
    });
  }

  checkPass(String password) {
    // ignore: non_constant_identifier_names
    final TRegex = RegExp(r'[0-9]');
    // ignore: non_constant_identifier_names
    final TRegex2 = RegExp(r'[ A-Z]');
    // ignore: non_constant_identifier_names
    final TRegex3 = RegExp(r'[a-z]');
    // ignore: non_constant_identifier_names
    final TRegex4 = RegExp(r'^[a-zA-Z0-9]+$');

    setState(() {
      holdPass = password;

      is8Chars = false;
      if (password.length >= 8) {
        is8Chars = true;
      }

      hasNum = false;
      if (TRegex.hasMatch(password)) {
        hasNum = true;
      }

      hasUpper = false;
      if (TRegex2.hasMatch(password)) {
        hasUpper = true;
      }

      hasLower = false;
      if (TRegex3.hasMatch(password)) {
        hasLower = true;
      }

      hasSymbol = false;
      if (TRegex4.hasMatch(password)) {
        hasSymbol = false;
      } else {
        hasSymbol = true;
      }

      weGucci = false;
      if(is8Chars == true && hasNum == true && hasUpper == true && hasLower == true && hasSymbol == true){
        weGucci = true;
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
                                    controller: FNameController,
                                    decoration: InputDecoration(
                                      errorText: FNameValidate
                                          ? 'First Name Can\'t Be Empty'
                                          : null,
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
                                    controller: LNameController,
                                    decoration: InputDecoration(
                                      errorText: LNameValidate
                                          ? 'Last Name Can\'t Be Empty'
                                          : null,
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
                              controller: UsernameController,
                              decoration: InputDecoration(
                                errorText: UsernameValidate
                                    ? 'Username not valid'
                                    : null,
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
                              controller: EmailController,
                              decoration: InputDecoration(
                                errorText: EmailValidate
                                    ? 'Email not valid'
                                    : null,
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
                              controller: PassController,
                              decoration: InputDecoration(
                                errorText: PassValidate
                                    ? 'Password Doesn\'t Meet Specifications'
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
                              //controller: PassController,
                              onChanged: (passwordConfirm) =>
                                  checkConfirm(passwordConfirm),

                              enableSuggestions: false,
                              autocorrect: false,
                              controller: PCController,
                              decoration: InputDecoration(
                                errorText: PCValidate
                                    ? 'Passwords don\'t match'
                                    : null,
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

  Future<void> login() async {
    APIHandler api = APIHandler();
    var data = await api.login(UsernameController.text, PassController.text);
    // var data = response.data;

      globals.fname = data["User"]["Firstname"];
      globals.lname = data["User"]["Lastname"];
      globals.email = data["User"]["Email"];
      globals.ID = data["User"]["_id"];
      globals.username = data["User"]["Username"];
      globals.verified = data["User"]["Verified"];


    // TODO:  Check registration status
    //        If verified, goto home page
    //        If not verified, go to email verify page
  }

  Future<void> signup() async {
    // TODO: submit form and goto email verification page
 APIHandler api = APIHandler();
    var response = await api.signup(FNameController.text, LNameController.text,
        EmailController.text, UsernameController.text, PassController.text);

    UserTaken = false;
    EmailTaken = false;
    print(response);
    if (response["error"]["emailUsed"]) {
      print("Email Used");
      EmailTaken = true;
    }
    if (response["error"]["usernameTaken"]) {
      print("Username Taken");
      UserTaken = true;
    }
    setState(() {
                  FNameController.text.isEmpty ? FNameValidate = true : FNameValidate = false;
                  LNameController.text.isEmpty ? LNameValidate = true : LNameValidate = false;
                  UsernameController.text.isEmpty || UserTaken == true ? UsernameValidate = true : UsernameValidate = false;
                  EmailController.text.isEmpty || EmailTaken == true ? EmailValidate = true : EmailValidate = false;
                  PassController.text.isEmpty || weGucci == false? PassValidate = true : PassValidate = false; //password has to meet certain specifications
                  PCController.text == PassController.text ? PCValidate = false : PCValidate = true;
                });

               
  
    // if (is8Chars == true && hasNum == true && hasUpper == true && hasLower == true && weGucci == true && hasSymbol == true && isSame == true && FNameValidate == false && LNameValidate == false && UsernameValidate == false && EmailValidate == false && PassValidate == false && PCValidate == false){
    //   login(),
    //   Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const Email(title: 'Email Verification'),
    //   ),
    // );
    //             }

    

    if (is8Chars == true &&
        hasNum == true &&
        hasUpper == true &&
        hasLower == true &&
        hasSymbol == true &&
        isSame == true &&
        FNameValidate == false &&
        LNameValidate == false &&
        UsernameValidate == false &&
        EmailValidate == false &&
        PassValidate == false &&
        PCValidate == false) {
          login();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Email(title: 'Email Verification'),
          ),
        );
      
    } else {
      print("testing");
      print(holdPass);
      print(temp);
      print('a');
      print(FNameValidate);
      print('b');
      print(LNameValidate);
      print('c');
      print(UsernameValidate);
      print('d');
      print(EmailValidate);
      print('e');
      print(PassValidate);
      print('f');
      print(PCValidate);

      // showDialog(
      //   barrierDismissible: true,
      //   context: context,
      //   builder: (context){
      //     return AlertDialog(
      //    title: const Text ('Error'),
      //   content: const Text('Error in pass field'),
      //   actions: <Widget> [
      //     TextButton(
      //       onPressed: () => Navigator.pop(context, 'Ok'),
      //       child: const Text('Ok'),
      //     ),
      //   ],
      //     );
      //   }
      //  );

    }
  }
}
