import 'package:warm_cloud/Home/data/datasource/latest_session/latest_index_session_datasource.dart';
import 'package:warm_cloud/Home/data/repository/latest_session/latest_session_repository.dart';

class LatestIndexSessionRepository extends LatestSessionRepository {
  final LatestIndexSessionDatasource latestIndexSessionDatasource;

  LatestIndexSessionRepository(this.latestIndexSessionDatasource);

  @override
  Future<int> getLatestSessionData() async {
    final int index = await latestIndexSessionDatasource.getLatestData();
    return index;
  }
}
