import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/presentation/controllers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:warm_cloud/Home/presentation/screens/home_page.dart';

import 'core/app_color/app_color.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor:
                  AppColor.white(Theme.of(context).brightness),
              fontFamily: 'Poppins'),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          home: const HomePage()),
    );
  }
}
