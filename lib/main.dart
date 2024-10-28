
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';
import 'package:warm_cloud/pages/home_page.dart';


void main(){
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget{
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.light(),
        // darkTheme: ThemeData.light(),
        // themeMode: ThemeMode.light,
        theme: ThemeData(
         scaffoldBackgroundColor: AppColor.white
        ),
        // ,
      home:const HomePage()
    );
  }
}