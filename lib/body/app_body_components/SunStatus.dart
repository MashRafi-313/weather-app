import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:warm_cloud/app_color/app_color.dart';

class SunStatus extends StatelessWidget{
  final String? sunrise;
  final String? sunset;
  late Duration? lengthOfDay;
   SunStatus({super.key,required this.sunrise,required this.sunset}) {
     DateTime sunSet = DateFormat.jm().parse(sunset!);
     DateTime sunRise = DateFormat.jm().parse(sunrise!);

     DateTime today = DateTime.now();
     sunSet = DateTime(today.year, today.month, today.day, sunSet.hour, sunSet.minute);
     sunRise = DateTime(today.year, today.month, today.day, sunRise.hour, sunRise.minute);

     // Calculate the length of day
     lengthOfDay = sunSet.difference(sunRise);

   }
  @override
  Widget build(BuildContext context) {
      return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("SUNRISE & SUNSET",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColor.silver
              ),
            ),
          //Dot Generator

          Text("Length of day:${lengthOfDay!.inHours}H${lengthOfDay!.inMinutes}M")

        ],
      );
  }

}
