import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warm_cloud/Home/data/services/local/shared_preferences_key.dart';

class IndexCubit extends Cubit<int> {
  IndexCubit() : super(-3);

  Future<void> loadPreviousIndex() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int currentIndex = prefs.getInt(KeyType.currentIndex) ?? 1;
      emit(currentIndex);
    } catch (e) {
      emit(-1);
    }
  }
}
