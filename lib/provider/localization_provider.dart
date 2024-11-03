import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider with ChangeNotifier {
  String language = "en";

  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("lang") ?? "en";
    notifyListeners();
  }

  storeLanguage(String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("lang", langCode);
    getLanguage();
    notifyListeners();
  }
}
