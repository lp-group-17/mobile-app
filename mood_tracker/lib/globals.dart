library my_prj.globals;

// User user = User("", "", "", "", "", false);
String fname = "";
String lname = "";
String email = "";
String ID = "";
String username = "";
bool verified = false;

class User {
  final String fname;
  final String lname;
  final String email;
  final String ID;
  final String username;
  final bool verified;

  User(this.fname, this.lname, this.email, this.ID, this.username,
      this.verified);

  User.fromJson(Map<String, dynamic> json)
      : fname = json['Firstname'],
        lname = json['Firstname'],
        email = json['Email'],
        ID = json['User'],
        username = json['Username'],
        verified = json['Verified'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };

}
