import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sphelper {
  Sphelper._(); // named constructor
  static Sphelper sphelper = Sphelper._();
  SharedPreferences sharedPreferences;
  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool checkFirstTime() {
    bool result = sharedPreferences.getBool('isFirstTime') ?? true;
    return result;
  }

  setFirstTime() {
    sharedPreferences.setBool('isFirstTime', false);
  }

  insertDate(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: CircularProgressIndicator(),
          );
        });
    sharedPreferences.setString('name', 'omar');
    sharedPreferences.setBool('isMale', true);
    sharedPreferences.setInt('age', 9);
    sharedPreferences.setDouble('GPA', 99.9);
    Navigator.pop(context);
  }

  getData() {
    sharedPreferences.getString('name');
    sharedPreferences.getBool('isMale');
    sharedPreferences.getInt('age');
    sharedPreferences.getDouble('GPA');
  }

  clearData() {
    sharedPreferences.clear();
  }

  updateData() {
    sharedPreferences.setString('name', 'ahmed');
  }
}
