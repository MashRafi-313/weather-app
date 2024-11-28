import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/Home/data/datasource/weather/weather_data_source_local.dart';
import 'package:warm_cloud/Home/data/repository/weather/weather_repository_local.dart';
import 'package:warm_cloud/Home/presentation/logic/cubit/weather_cubit/weather_cubit.dart';
import 'package:warm_cloud/Home/presentation/widgets/home_screen/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    _initializeSharedPreferences();
  }

  Future<void> _initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        WeatherRepositoryLocal(
          WeatherDataSourceLocal(sharedPreferences: sharedPreferences),
        ),
      )..loadWeatherData(),
      child: Scaffold(
        body: BlocBuilder<WeatherCubit, WeatherDataState>(
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
                return HomePage(
                  weatherDataInfo: weatherDataInfo,
                );

              case WeatherDataError(error: final error):
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<WeatherCubit>().loadWeatherData();
                    },
                    child: const Text("retry"),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
