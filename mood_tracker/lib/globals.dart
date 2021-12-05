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

// library my_prj.globals;
// import 'dart:convert';
// import 'HistFiles/HistoryModel.dart';

// List<HistoryModel> yourDataModelFromJson(String str) => List<HistoryModel>.from(json.decode(str).map((x) => User.fromJson(x)));

// String yourDataModelToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class User {
//     String fname;
//     String lname;
//     String email;
//     String ID;
//     String username;

//     User({
//         required this.fname,
//         required this.lname,
//         required this.email,
//         required this.ID,
//         required this.username,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         fname: json["id"],
//         lname: json["mentor_id"],
//         email: json["mentee_id"],
//         ID: json["status"],
//         username: json["session_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": fname,
//         "mentor_id": lname,
//         "mentee_id": ID,
//         "status": username,
//         "email": email,
//     };
// }