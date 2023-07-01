part of 'ads_bloc.dart';

@freezed
class AdsState with _$AdsState {
  const factory AdsState({
    required bool isLoading,
    required Option<Either<NetworkFailure, dynamic>> loadFailureOrSuccessOption,
  }) = _AdsState;

  factory AdsState.initial() => AdsState(
        isLoading: false,
        loadFailureOrSuccessOption: none(),
      );
}
