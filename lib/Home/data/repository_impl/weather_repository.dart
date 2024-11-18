import '../../domain/model/weather_data_info.dart';
import '../datasource/local/my_shared_preferences.dart';

class WeatherRepository {
  Map<String, dynamic>? jsonResponse;

  Future<WeatherDataInfo> loadDataFromSharedPreferences() async {
    try {
      SharedPrefStorage prefs = SharedPrefStorage();
      jsonResponse = await prefs.getJsonObjectFromSharedPreferences();
      if (jsonResponse == null) {
        await prefs.saveJsonToSharedPreferences();
        jsonResponse = await prefs.getJsonObjectFromSharedPreferences();
        return WeatherDataInfo.fromJson(jsonResponse!);
      } else {
        return WeatherDataInfo.fromJson(jsonResponse!);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
