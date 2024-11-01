import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/data_storage/shared_preferences_key.dart';
import 'package:warm_cloud/pages/home_page.dart';


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
  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(KeyType.darkMode) ?? false;
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void toggleMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
    await prefs.setBool(KeyType.darkMode, _themeMode == ThemeMode.dark);
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
