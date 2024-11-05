import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_color/app_color.dart';
import '../../provider/index_provider.dart';
import '../../provider/weather_data_info_provider.dart';

class LocationName extends StatelessWidget {
  const LocationName({super.key});

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final weatherDataInfoProvider = Provider.of<WeatherDataInfoProvider>(context);
    String location = weatherDataInfoProvider
        .weatherDataInfo.weatherData![indexProvider.index].location!;
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: location,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
              color: AppColor.mineShaft(Theme.of(context).brightness),
            textBaseline:  TextBaseline.alphabetic
          ),
        ),
        const TextSpan(text: "  "),
        WidgetSpan(
            child: Image.asset('assets/images/locationIndicator.png',
              color: AppColor.mineShaft(Theme.of(context).brightness),
            ),
            baseline: TextBaseline.alphabetic,
            alignment: PlaceholderAlignment.baseline,
            )
      ]),
    );
  }
}
