import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/weather/weather_repository_local.dart';
import '../logic/bloc/weather_data_bloc.dart';
import '../widgets/homepage/app_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherBloc(WeatherRepositoryLocal())..add(LoadWeatherDataEvent()),
      child: Scaffold(
        body: BlocBuilder<WeatherBloc, WeatherDataState>(
          builder: (context, state) {
            switch (state) {
              case WeatherDataInitial():
                return const Center(
                  child: Text("Initializing..."),
                );

              case WeatherDataLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case WeatherDataLoaded(weatherDataInfo: final weatherDataInfo):
                return AppBody(
                  weatherDataInfo: weatherDataInfo,
                );

              case WeatherDataError(error: final error):
                return Center(
                  child: Text(
                    'Error: $error',
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
