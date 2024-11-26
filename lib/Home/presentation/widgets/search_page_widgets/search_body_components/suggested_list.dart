import 'package:flutter/material.dart';
import 'package:warm_cloud/Home/presentation/widgets/search_page_widgets/search_body_components/warning_status_info.dart';
import 'package:warm_cloud/core/CustomWidgets/custom_card.dart';
import 'package:warm_cloud/core/CustomWidgets/warning_hazard.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';

import '../../../../../core/app_color/app_color.dart';

class SuggestedList extends StatelessWidget {
  final String? location;
  final String? temperature;
  final String? weatherEmoji;
  String? warningTitle;

  SuggestedList(
      {super.key,
      required this.location,
      required this.temperature,
      required this.weatherEmoji,
      required this.warningTitle});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      marginVertical: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location!,
            style: TextStyles.semibold20.copyWith(
              color: AppColor.mineShaft(Theme.of(context).brightness),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    temperature!,
                    style: TextStyles.medium60.copyWith(
                      color: AppColor.mineShaft(Theme.of(context).brightness),
                    ),
                  ),
                  const SizedBox(height: 17),
                  if (warningTitle != null) const WarningHazard(),
                ],
              ),
              const Spacer(),
              WarningStatusInfo(weatherEmoji: weatherEmoji,warningTitle: warningTitle,)
            ],
          ),
        ],
      ),
    );
  }
}
