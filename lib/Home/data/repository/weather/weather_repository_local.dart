import 'package:dartz/dartz.dart';
import 'package:warm_cloud/Home/data/datasource/weather/weather_data_source_local.dart';
import 'package:warm_cloud/Home/data/model/weather_info_model.dart';
import 'package:warm_cloud/Home/data/repository/weather/weather_repository.dart';


class WeatherRepositoryLocal extends WeatherRepository {
  final WeatherDataSourceLocal weatherDataSourceLocal;

  WeatherRepositoryLocal(this.weatherDataSourceLocal);
  @override
  Future<Either<String, WeatherDataInfo>> getWeatherDataInfo() async {
    try {
      Map<String, dynamic>? jsonResponse =
          await weatherDataSourceLocal.getData();
      if (jsonResponse == null) {
        await weatherDataSourceLocal.saveData();
        jsonResponse = await weatherDataSourceLocal.getData();
      }
      if (jsonResponse != null) {
        final weatherDataInfo = WeatherDataInfo.fromJson(jsonResponse!);
        return Right(weatherDataInfo);
      } else {
        return const Left("Weather data is currently unavailable");
      }
    } catch (e) {
      return Left("Error occurred: ${e.toString()}");
    }
  }
}
