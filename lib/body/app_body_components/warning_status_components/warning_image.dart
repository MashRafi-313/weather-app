import 'package:flutter/cupertino.dart';

class WarningImage extends StatelessWidget {
  final String? weather_emoji;

  const WarningImage({super.key, required this.weather_emoji});

  @override
  Widget build(BuildContext context) {
    return Text(
      weather_emoji!,
      style: const TextStyle(fontSize: 70),
    );
  }
}
