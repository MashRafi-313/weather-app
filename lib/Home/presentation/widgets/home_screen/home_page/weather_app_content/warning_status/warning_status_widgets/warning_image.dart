import 'package:flutter/material.dart';

class WarningImage extends StatelessWidget {
  final String? weatherEmoji;

  const WarningImage({super.key, required this.weatherEmoji});

  @override
  Widget build(BuildContext context) {
    return Text(
      weatherEmoji!,
      style: const TextStyle(fontSize: 70),
    );
  }
}
