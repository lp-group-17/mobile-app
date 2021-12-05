library my_prj.globals;

class User {
 final String fname;
final String lname;
 final String email;
final String ID;
 final String username;

  User(this.fname,this.lname, this.email, this.ID, this.username);

  User.fromJson(Map<String, dynamic> json)
      : fname = json['Firstname'],
        lname = json['Firstname'],
        email = json['Email'],
        ID = json['User'],
        username = json['Username'];


  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}