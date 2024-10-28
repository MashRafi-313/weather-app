import 'package:flutter/cupertino.dart';

class WeatherImage extends StatelessWidget{
  final String? weatherImage;
  const WeatherImage({super.key, required this.weatherImage});

  @override
  Widget build(BuildContext context) {
     return Text(
       weatherImage!,
       style: const TextStyle(
         fontSize: 97
       ),
     );
  }

}