import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/Home/data/datasource/local/shared_preferences_key.dart';

class SharedPrefStorage {
  Future<void> saveJsonToSharedPreferences() async {
    final String? jsonString =
        await rootBundle.loadString('assets/sample.json');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KeyType.jsonData, jsonString!);
  }

  Future<Map<String, dynamic>?> getJsonObjectFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonResponse = prefs.getString(KeyType.jsonData);
    if (jsonResponse != null) {
      return jsonDecode(jsonResponse);
    }
    return null;
  }
}
