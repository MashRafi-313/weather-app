import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warm_cloud/Home/data/datasource/latest_session/latest_index_session_datasource.dart';
import 'package:warm_cloud/Home/data/model/weather_info_model.dart';
import 'package:warm_cloud/Home/data/repository/latest_session/latest_index_session_repository.dart';
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
  late int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatestSessionCubit(
          LatestIndexSessionRepository(LatestIndexSessionDatasource()))
        ..onLoadLatestSession(),
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
                child: Text('Error:$error'),
              );
          }
        },
      ),
    );
  }
}
