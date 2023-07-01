part of 'crowd_bloc.dart';

@freezed
class CrowdState with _$CrowdState {
  const factory CrowdState.initial() = _Initial;
  const factory CrowdState.loadInProgress() = DataTransferInProgress;
  const factory CrowdState.loadMoreInProgress() = LoadMoreInProgress;
  const factory CrowdState.loadSuccess(response) = LoadSuccess;
  const factory CrowdState.loadFailure(NetworkFailure networkFailure) =
  LoadFailure;
}
