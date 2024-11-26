import 'package:flutter/material.dart';

import '../../data/model/weather_data_info.dart';
import '../widgets/search_page_widgets/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.weatherDataInfo});

  final WeatherDataInfo? weatherDataInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBody(
        weatherDataInfo: weatherDataInfo,
      ),
    );
  }
}
