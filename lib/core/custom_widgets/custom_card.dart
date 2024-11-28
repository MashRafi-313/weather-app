import 'package:flutter/material.dart';
import 'package:warm_cloud/core/app_color/app_color.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double marginHorizontal;
  final double marginVertical;
  final double paddingValue;
  const CustomCard({
    super.key,
    this.borderRadius = 5,
    this.marginHorizontal = 20,
    this.marginVertical = 0,
    this.paddingValue = 10,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal,
        vertical: marginVertical,
      ),
      padding:  EdgeInsets.all(paddingValue),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: AppColor.hintOfRed(Theme.of(context).brightness),
      ),
      child: child,
    );
  }
}
