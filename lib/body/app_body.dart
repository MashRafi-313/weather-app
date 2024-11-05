import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/body/app_body_components/app_content.dart';
import 'package:warm_cloud/data_storage/shared_preferences_key.dart';
import 'package:warm_cloud/model/weather_data_info.dart';
import 'package:provider/provider.dart';
import 'package:warm_cloud/provider/index_provider.dart';
import 'package:warm_cloud/provider/weather_data_info_provider.dart';

class AppBody extends StatefulWidget {
  final WeatherDataInfo weatherDataInfo;
  const AppBody({
    super.key, required this.weatherDataInfo,
  });

  @override
  State<AppBody> createState() => _AppBodyState();
}


class _AppBodyState extends State<AppBody> {

  @override
  void initState() {
    super.initState();
  }
  Stream<int> _loadStreamPrevIndex() async* {
    yield await _loadPrevIndex();
  }

  Future<int> _loadPrevIndex() async {
    int presentIndex;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    presentIndex = prefs.getInt(KeyType.currentIndex) ?? 1;
    return presentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _loadStreamPrevIndex(),
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
                child: Text('Error:${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              int currentIndex = snapshot.data!;
              return AppContent(weatherDataInfo: widget.weatherDataInfo);
            } else {
              return const Center(
                child: Text("No weather data available"),
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
    );
  }
}
