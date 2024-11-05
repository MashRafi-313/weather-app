import 'package:flutter/material.dart';
import 'package:warm_cloud/data_storage/my_shared_preferences.dart';
import 'package:warm_cloud/model/weather_data_info.dart';
import 'package:warm_cloud/provider/weather_data_info_provider.dart';
import 'package:provider/provider.dart';
import '../body/app_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherDataInfo> _weatherDataInfo;
  @override
  void initState() {
    super.initState();
    _weatherDataInfo = _loadDataFromSharedPreferences();
  }

  Future<WeatherDataInfo> _loadDataFromSharedPreferences() async {
    SharedPrefStorage prefs = SharedPrefStorage();
    try {
      final Map<String, dynamic>? jsonResponse =
      await prefs.getJsonObjectFromSharedPreferences();
      if (jsonResponse == null) {
        await prefs.saveJsonToSharedPreferences();
        final newResponse = await prefs.getJsonObjectFromSharedPreferences();
        return WeatherDataInfo.fromJson(newResponse!);
      } else {
        return WeatherDataInfo.fromJson(jsonResponse);
      }
    } catch (e) {
      debugPrint("Error loading weather data: $e");
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherDataInfo>(
        future: _weatherDataInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          } else if (snapshot.hasData) {
            // WidgetsBinding.instance.addPostFrameCallback((_){
            //   Provider.of<WeatherDataInfoProvider>(context).updateWeatherDataInfo(snapshot.data!);
            // });
            WeatherDataInfo weatherDataInfo = snapshot.data!;
            return AppBody(weatherDataInfo: weatherDataInfo);
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
