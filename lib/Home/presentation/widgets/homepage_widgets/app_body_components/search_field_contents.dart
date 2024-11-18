import 'package:flutter/material.dart';
import '../../../../../core/CustomWidgets/custom_card.dart';
import '../../../../../core/app_color/app_color.dart';
import '../../../../../core/styles/text_styles.dart';

class SearchFieldContents extends StatelessWidget{
  const SearchFieldContents({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomCard(
      paddingValue: 4,
      child: ListTile(
        title: Text(
          "Search Location",
          style: TextStyles.regular15.copyWith(
            color: AppColor.silver(Theme.of(context).brightness),
          ),
        ),
        trailing: Icon(
          Icons.search,
          color: AppColor.silver(Theme.of(context).brightness),
        ),
      ),
    );
  }

}