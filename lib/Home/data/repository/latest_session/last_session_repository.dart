import 'package:warm_cloud/Home/data/datasource/latest_session/last_session_datasource.dart';

class LastSessionRepository {
  final LastSessionDataSource lastSessionDatasource;

  LastSessionRepository(this.lastSessionDatasource);

  Future<int> getLatestSessionData() async {
    final sessionData = await lastSessionDatasource.getLatestData();
    return sessionData;
  }
}
