import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/body/app_body_components/app_content.dart';
import 'package:warm_cloud/data_storage/shared_preferences_key.dart';
import 'package:warm_cloud/model/weather_data_info.dart';

class AppBody extends StatefulWidget {
  final WeatherDataInfo? weatherDataInfo;
  final int defaultIndex;

  const AppBody({
    super.key,
    required this.weatherDataInfo,
    this.defaultIndex = 1,
  });

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  late int currentIndex;

  Stream<int> _loadStreamPrevIndex() async* {
    yield await _loadPrevIndex();
  }

  Future<int> _loadPrevIndex() async {
    int presentIndex;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    presentIndex = prefs.getInt(KeyType.currentIndex) ?? widget.defaultIndex;
    return presentIndex;
  }

  void updateIndex(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentIndex = index;
    });
    prefs.setInt(KeyType.currentIndex, currentIndex);
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
              return AppContent(
                weatherDataInfo: widget.weatherDataInfo,
                updateIndex: updateIndex,
                currentIndex: currentIndex,
              );
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
