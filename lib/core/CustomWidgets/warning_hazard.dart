import 'package:flutter/material.dart';
import 'package:warm_cloud/core/styles/text_styles.dart';

import '../app_color/app_color.dart';

class WarningHazard extends StatelessWidget {
  const WarningHazard({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(child: Image.asset('assets/images/warningHazard.png')),
          const TextSpan(text: " "),
          TextSpan(
            text: "WARNING",
            style: TextStyles.regular12.copyWith(
              color: AppColor.gold(Theme.of(context).brightness),
            ),
          ),
        ],
      ),
    );
  }
}
