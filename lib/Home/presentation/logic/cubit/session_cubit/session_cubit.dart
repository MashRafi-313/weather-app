import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warm_cloud/Home/data/repository/latest_session/last_session_repository.dart';

part 'session_state.dart';

class LatestSessionCubit extends Cubit<LatestSessionState> {
  LatestSessionCubit(this.latestSessionRepository)
      : super(LatestSessionInitial());
  final LastSessionRepository latestSessionRepository;

  Future<void> loadLatestSession() async {
    emit(LatestSessionLoading());
    try {
      final int latestSessionData =
          await latestSessionRepository.getLatestSessionData();
      emit(LatestSessionLoaded(latestSessionData));
    } catch (error) {
      emit(LatestSessionError(error.toString()));
    }
  }
}
