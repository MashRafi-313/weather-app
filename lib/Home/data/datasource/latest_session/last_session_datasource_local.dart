import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/Home/data/datasource/latest_session/last_session_datasource.dart';
import 'package:warm_cloud/core/utility/shared_preferences_key.dart';

class LastSessionDatasourceLocal extends LastSessionDataSource {
  final SharedPreferences sharedPreferences;

  LastSessionDatasourceLocal({required this.sharedPreferences});
  @override
  Future<int> getLatestData() async {
    final int latestData = sharedPreferences.getInt(KeyType.currentIndex) ?? 1;
    return latestData;
  }
}
