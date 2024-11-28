import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/Home/data/datasource/weather/weather_data_source.dart';
import 'package:warm_cloud/core/utility/asset_path.dart';
import 'package:warm_cloud/core/utility/shared_preferences_key.dart';

class WeatherDataSourceLocal extends WeatherDataSource {
  final SharedPreferences sharedPreferences;

  WeatherDataSourceLocal({required this.sharedPreferences});
  @override
  Future<void> saveData() async {
    final String jsonString =
        await rootBundle.loadString(AssetPaths.sampleJson);
    await sharedPreferences.setString(KeyType.jsonData, jsonString);
  }

  @override
  Future<Map<String, dynamic>?> getData() async {
    final String? jsonResponse = sharedPreferences.getString(KeyType.jsonData);
    if (jsonResponse != null) {
      return jsonDecode(jsonResponse);
    }
    return null;
  }
}
