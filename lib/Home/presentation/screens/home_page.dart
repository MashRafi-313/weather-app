import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/data/repository_impl/weather_repository.dart';
import '../../domain/model/weather_data_info.dart';
import '../widgets/homepage_widgets/app_body.dart';

class HomePage extends StatefulWidget {
  const
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<WeatherDataInfo> _loadDataFromStream() async* {
    yield await _loadDataFromRepository();
  }

  Future<WeatherDataInfo> _loadDataFromRepository() async {
    try {
      final weatherRepository = WeatherRepository();
      WeatherDataInfo weatherDataInfo =
          await weatherRepository.loadDataFromSharedPreferences();
      return weatherDataInfo;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<WeatherDataInfo>(
        stream: _loadDataFromStream(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error:${snapshot.error}',
                  ),
                );
              } else if (snapshot.hasData) {
                WeatherDataInfo? weatherDataInfo = snapshot.data!;
                return AppBody(
                  weatherDataInfo: weatherDataInfo,
                );
              } else {
                return const Center(
                  child: Text(
                    "No weather data available",
                  ),
                );
              }
            case ConnectionState.none:
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
