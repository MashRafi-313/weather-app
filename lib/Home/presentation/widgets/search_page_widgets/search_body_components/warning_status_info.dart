import 'package:flutter/material.dart';

import '../../../../../core/app_color/app_color.dart';
import '../../../../../core/styles/text_styles.dart';

class WarningStatusInfo extends StatelessWidget {
  final String? weatherEmoji;
  final String? warningTitle;
  const WarningStatusInfo({super.key, this.weatherEmoji, this.warningTitle});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Text(weatherEmoji!, style: const TextStyle(fontSize: 80)),
        if (warningTitle != null)
          Text(
            warningTitle!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyles.regular12.copyWith(
              color: AppColor.gold(Theme.of(context).brightness),
            ),
          ),
      ],
    );
  }
}
