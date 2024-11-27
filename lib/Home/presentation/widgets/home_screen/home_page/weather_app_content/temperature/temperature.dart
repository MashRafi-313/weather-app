import 'package:flutter/material.dart';
import 'package:warm_cloud/core/app_color/app_color.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';


class Temperature extends StatelessWidget {
  final String? temperature;

  const Temperature({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Text(
      temperature!,
      style: TextStyles.medium70.copyWith(
        color: AppColor.mineShaft(Theme.of(context).brightness),
      ),
    );
  }
}
