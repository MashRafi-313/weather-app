import 'package:warm_cloud/Home/data/repository/weather/weather_repository.dart';

import '../../model/weather_data_info.dart';
import '../../services/local/local_data_service.dart';

class WeatherRepositoryLocal extends WeatherRepository {
  Map<String, dynamic>? jsonResponse;
  static WeatherDataInfo weatherDataInfo = WeatherDataInfo();

  @override
  Future<WeatherDataInfo> getWeatherDataInfo() async {
    try {
      LocalDataProvider localDataProvider = LocalDataProvider();
      jsonResponse =
          await localDataProvider.getJsonObjectFromSharedPreferences();
      if (jsonResponse == null) {
        await localDataProvider.saveJsonToSharedPreferences();
        jsonResponse =
            await localDataProvider.getJsonObjectFromSharedPreferences();
        weatherDataInfo = WeatherDataInfo.fromJson(jsonResponse!);
        return weatherDataInfo;
      } else {
        weatherDataInfo = WeatherDataInfo.fromJson(jsonResponse!);
        return weatherDataInfo;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
