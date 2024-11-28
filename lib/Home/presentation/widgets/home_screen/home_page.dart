import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/Home/data/datasource/latest_session/last_session_datasource_local.dart';
import 'package:warm_cloud/Home/data/model/weather_info_model.dart';
import 'package:warm_cloud/Home/data/repository/latest_session/last_session_repository.dart';
import 'package:warm_cloud/Home/presentation/logic/cubit/session_cubit/session_cubit.dart';
import 'package:warm_cloud/Home/presentation/widgets/home_screen/home_page/weather_app_content.dart';

class HomePage extends StatefulWidget {
  final WeatherDataInfo? weatherDataInfo;
  final int defaultIndex;

  const HomePage({
    super.key,
    required this.weatherDataInfo,
    this.defaultIndex = 1,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences _sharedPreferences;

  @override
  void initState() {
    super.initState();
    _initializeSharedPreferences();
  }

  Future<void> _initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatestSessionCubit(
        LastSessionRepository(
          LastSessionDatasourceLocal(sharedPreferences: _sharedPreferences),
        ),
      )..loadLatestSession(),
      child: BlocBuilder<LatestSessionCubit, LatestSessionState>(
        builder: (context, state) {
          switch (state) {
            case LatestSessionInitial():
              return const Center(
                child: Text("Initializing..."),
              );
            case LatestSessionLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case LatestSessionLoaded(latestSession: final currentIndex):
              return WeatherAppContent(
                weatherDataInfo: widget.weatherDataInfo,
                currentIndex: currentIndex,
              );
            case LatestSessionError(error: final error):
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<LatestSessionCubit>().loadLatestSession();
                  },
                  child: const Text("retry"),
                ),
              );
          }
        },
      ),
    );
  }
}
