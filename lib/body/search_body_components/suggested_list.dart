import 'package:flutter/cupertino.dart';
import 'package:warm_cloud/app_color/app_color.dart';

class SuggestedList extends StatelessWidget {
  final String? location;
  final String? temperature;
  final String? weatherEmoji;
  String? weatherTitle;

  SuggestedList(
      {super.key,
      required this.location,
      required this.temperature,
      required this.weatherEmoji,
      required this.weatherTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical:2),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.hintOfRed
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.mineShaft),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                temperature!,
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    color: AppColor.mineShaft),
              ),
              const SizedBox(
                width: 60,
              ),
              Text(weatherEmoji!,
                  style: const TextStyle(
                    fontSize: 80,
                  ))
            ],
          ),
          if(weatherTitle != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                      child: Image.asset('assets/images/warningHazard.png')),
                  const TextSpan(text: " "),
                  TextSpan(
                      text: "WARNING",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.gold)),
                ]),
              ),
              const SizedBox(
                width: 60,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    weatherTitle!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.gold),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
