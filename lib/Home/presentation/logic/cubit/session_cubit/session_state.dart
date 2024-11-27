part of 'session_cubit.dart';

sealed class LatestSessionState extends Equatable {}

final class LatestSessionInitial extends LatestSessionState {
  @override
  List<Object?> get props => [];
}

final class LatestSessionLoading extends LatestSessionState {
  @override
  List<Object?> get props => [];
}

final class LatestSessionLoaded extends LatestSessionState {
  final dynamic latestSession;

  LatestSessionLoaded(this.latestSession);

  @override
  List<Object?> get props => [latestSession];
}

final class LatestSessionError extends LatestSessionState {
  final String error;

  LatestSessionError(this.error);

  @override
  List<Object?> get props => [error];
}
