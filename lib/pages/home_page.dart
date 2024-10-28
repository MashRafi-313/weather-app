import 'package:flutter/material.dart';
import 'package:warm_cloud/data_storage/my_shared_preferences.dart';
import 'package:warm_cloud/model/weather_data_info.dart';

import '../body/app_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get builder => null;

  Future<WeatherDataInfo> loadDataFromSharedPreferences() async {
    try {
      SharedPrefStorage prefs = SharedPrefStorage();
      await prefs.saveJsonToSharedPreferences();
      final Map<String, dynamic>? jsonResponse =
          await prefs.getJsonObjectFromSharedPreferences();
      if (jsonResponse != null) {
        return WeatherDataInfo.fromJson(jsonResponse);
      } else {
        throw 'No JSON data found in SharedPreferences';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadDataFromSharedPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error:${snapshot.error}',
            ),
          );
        } else if (snapshot.hasData) {
          WeatherDataInfo? weatherDataInfo = snapshot.data!;
          return Scaffold(
            body: AppBody(weatherDataInfo: weatherDataInfo),
          );
        } else {
          return const Center(
            child: Text(
              "No weather data available",
            ),
          );
        }
      },
    );
  }
}
