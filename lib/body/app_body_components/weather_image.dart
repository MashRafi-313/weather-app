import 'package:flutter/cupertino.dart';
import 'package:warm_cloud/provider/index_provider.dart';
import 'package:provider/provider.dart';
import 'package:warm_cloud/provider/weather_data_info_provider.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({super.key});

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final weatherDataInfoProvider = Provider.of<WeatherDataInfoProvider>(context);
    String weatherImage = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].weatherEmoji!;
    return Text(
      weatherImage,
      style: const TextStyle(fontSize: 97),
    );
  }
}
