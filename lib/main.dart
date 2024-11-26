import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home/presentation/providers/theme_provider.dart';
import 'weather_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const WeatherApp(),
    ),
  );
}
