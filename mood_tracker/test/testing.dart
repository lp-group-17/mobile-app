// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:mood_tracker/api/APIHandler.dart';
import 'package:mood_tracker/globals.dart' as globals;

void main() {
  test('User "rbugge2" should be returned', () async {
    final api = APIHandler();
    var temp = await api.login('rbugge2', 'Testing1!');
    expect(temp["User"], {
      '_id': '61b0f37b4c7d2bb0ca6b62b3',
      "Firstname": "rrr",
      "Lastname": "bbb",
      "Email": "rbugge@icloud.com",
      "Username": "rbugge2",
      "Verified": true
    });
  });

  test('First Event "COP4331 Presentation" should be returned', () async {
    final api = APIHandler();
    globals.ID = '61b0f37b4c7d2bb0ca6b62b3';
    var temp = await api.getEvents();
    expect(temp["Events"][0], {
      '_id': '61b0ff694c7d2bb0ca6b62b7',
      "User": "61b0f37b4c7d2bb0ca6b62b3",
      "Title": "COP4331 Presentation",
      "Descrip": "Unit Test",
      "From": "2021-12-08T17:45:00.000",
      "To": "2021-12-08T18:00:00.000",
      "AllDay": false
    });
  });

  test('Last Entry for user "rbugge2" should be returned', () async {
    final api = APIHandler();
    globals.ID = '61b0f37b4c7d2bb0ca6b62b3';
    var temp = await api.getEntries();
    expect(temp["Entries"].last, {
      '_id': '61b100584c7d2bb0ca6b62b8',
      "User": "61b0f37b4c7d2bb0ca6b62b3",
      "Date": "2021-12-08T13:58:33.098374",
      "Descrip": "Unit Test",
      "Q1": 3,
      "Q2": 3,
      "Q3": 3,
      "Q4": 3,
    });
  });
}
