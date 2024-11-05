import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:warm_cloud/provider/index_provider.dart';
import 'package:warm_cloud/provider/theme_provider.dart';
import 'package:warm_cloud/provider/weather_data_info_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => IndexProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => WeatherDataInfoProvider(),
      )
    ],
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColor.white(Theme.of(context).brightness),
          fontFamily: 'Poppins'),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: const HomePage(),
    );
  }
}
