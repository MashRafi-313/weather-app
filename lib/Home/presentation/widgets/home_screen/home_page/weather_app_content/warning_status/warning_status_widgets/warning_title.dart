import 'package:flutter/material.dart';
import 'package:warm_cloud/core/app_color/app_color.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';

import '../../../../../../../../core/app_color/app_color.dart';

class WarningTitle extends StatelessWidget {
  final String? title;

  const WarningTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyles.regular15.copyWith(
        color: AppColor.gold(Theme.of(context).brightness),
      ),
    );
  }
}
