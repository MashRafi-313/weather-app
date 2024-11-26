import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/app_color/app_color.dart';

class WarningTitle extends StatelessWidget {
  final String? title;

  const WarningTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColor.gold(Theme.of(context).brightness),
      ),
    );
  }
}
