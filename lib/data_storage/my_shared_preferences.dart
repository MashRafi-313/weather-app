import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefStorage {
  Future<void> saveJsonToSharedPreferences() async {
    final String? jsonString =
        await rootBundle.loadString('assets/sample.json');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jsonData', jsonString!);
  }

  Future<Map<String, dynamic>?> getJsonObjectFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonResponse = prefs.getString('jsonData');
    if (jsonResponse != null) {
      return jsonDecode(jsonResponse);
    }
    return null;
  }
}
