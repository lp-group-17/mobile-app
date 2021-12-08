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

  Future<Map<String, dynamic>> setVerification(String userID) async {
    var response = await dio.post(url + 'Verify', data: {"ID": userID});
    return response.data;
  }
}
