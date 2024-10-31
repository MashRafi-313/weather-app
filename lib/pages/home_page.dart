import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/data_storage/my_shared_preferences.dart';
import 'package:warm_cloud/model/weather_data_info.dart';

import '../body/app_body.dart';

class HomePage extends StatefulWidget {
  final Function() toggleMode;

  const HomePage({
    super.key,
    required this.toggleMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future<WeatherDataInfo> loadDataFromSharedPreferences() async {
    try {
      SharedPrefStorage prefs = SharedPrefStorage();
      final Map<String, dynamic>? jsonResponse =
          await prefs.getJsonObjectFromSharedPreferences();

      if(jsonResponse == null){
         await prefs.saveJsonToSharedPreferences();
        final Map<String,dynamic>? jsonResponse =
         await prefs.getJsonObjectFromSharedPreferences();
        return WeatherDataInfo.fromJson(jsonResponse!);
      }
     else {
        return WeatherDataInfo.fromJson(jsonResponse);
      }

    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherDataInfo>(
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
            return AppBody(
                weatherDataInfo: weatherDataInfo,
                toggleMode: widget.toggleMode);
          } else {
            return const Center(
              child: Text(
                "No weather data available",
              ),
            );
          }
        },
      ),
    );
  }
}
