import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/warning_status_components/warning_info.dart';
import 'package:warm_cloud/Home/presentation/widgets/homepage_widgets/app_body_components/warning_status_components/warning_title.dart';
import 'package:warm_cloud/core/CustomWidgets/custom_card.dart';

class WarningStatus extends StatelessWidget {
  final String? rainPercentage;
  final String? expectedTime;
  final String? weatherEmoji;
  final String? warningTitle;

  const WarningStatus(
      {super.key,
      required this.rainPercentage,
      required this.expectedTime,
      required this.warningTitle,
      required this.weatherEmoji});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WarningInfo(
            expectedTime: expectedTime,
            rainPercentage: rainPercentage,
            weatherEmoji: weatherEmoji,
          ),
          WarningTitle(title: warningTitle),
        ],
      ),
    );
  }
}
