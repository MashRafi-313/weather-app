import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/pages/home_page.dart';
import 'package:warm_cloud/pages/search_page.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleMode() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColor.white(Theme.of(context).brightness),
          fontFamily: 'Poppins'),
      // theme: ThemeData.light(
      // ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: HomePage(toggleMode: toggleMode),
    );
  }
}
