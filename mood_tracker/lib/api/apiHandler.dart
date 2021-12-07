import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:mood_tracker/globals.dart' as globals;

class APIHandler {
  static const String url = "https://www.g17ccmt.com/api/";
  var dio = Dio();

  Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String, dynamic> body = {"loginID": username, "password": password};

    var response = await dio.post(url + 'login', data: body);
    return response.data;
  }

  void addEvent(Map<String, dynamic> event) {
    dio.post(url + 'addEvent', data: event);
  }

  Future<Map<String, dynamic>> getEvents() async {
    var response =
        await dio.post(url + 'getEvents', data: {"User": globals.ID});
    return response.data;
  }

  void addEntry(Map<String, dynamic> entry) {
    dio.post(url + 'addEntry', data: entry);
  }

  Future<Map<String, dynamic>> getEntries() async {
    var response =
        await dio.post(url + 'getEntries', data: {"User": globals.ID});
    return response.data;
  }

  Future<Map<String, dynamic>> signup(String firstname, String lastname,
      String email, String username, String password) async {
    Map<String, dynamic> body = {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "username": username,
      "password": password
    };

    var response = await dio.post(url + 'adduser', data: body);
    return response.data;
  }

  // Future<Response> post(Map<String, dynamic> body, String endpoint) {
  //   var dio = Dio();
  //   return dio.post(url + endpoint, data: body);
  // }
}

// class APIHandler {
//   static const String url = "http://137.184.153.148/api/";

//   void signup(String firstname, String lastname, String email, String username,
//       String password) {
//     Map<String, dynamic> body = {
//       "firstname": firstname,
//       "lastname": lastname,
//       "email": email,
//       "username": username,
//       "password": password
//     };

//     post(body, 'adduser');
//   }

//   Future<http.Response> post(Map<String, dynamic> body, String endpoint) {
//     return http.post(
//       Uri.parse(url + endpoint),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(body),
//     );
//   }
// }

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
