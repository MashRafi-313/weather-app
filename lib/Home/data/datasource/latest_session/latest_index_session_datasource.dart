import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/Home/data/datasource/latest_session/latest_session_datasource.dart';
import 'package:warm_cloud/core/utility/shared_preferences_key.dart';

class LatestIndexSessionDatasource extends LatestSessionDataSource {
  @override
  Future<int> getLatestData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int currentIndex = prefs.getInt(KeyType.currentIndex) ?? 1;
    return currentIndex;
  }
}
