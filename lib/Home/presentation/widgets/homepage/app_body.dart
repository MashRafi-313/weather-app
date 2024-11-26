import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warm_cloud/Home/presentation/logic/cubit/index_cubit.dart';

import '../../../data/model/weather_data_info.dart';
import 'app_body/app_content.dart';

class AppBody extends StatefulWidget {
  final WeatherDataInfo? weatherDataInfo;
  final int defaultIndex;

  const AppBody({
    super.key,
    required this.weatherDataInfo,
    this.defaultIndex = 1,
  });

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  late int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexCubit()..loadPreviousIndex(),
      child: BlocBuilder<IndexCubit, int>(
        builder: (context, currentIndex) {
          if (currentIndex == -1) {
            return const Center(child: Text('Error loading index...'));
          }
          return currentIndex == -3
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : AppContent(
                  weatherDataInfo: widget.weatherDataInfo,
                  currentIndex: currentIndex,
                );
        },
      ),
    );
  }
}
