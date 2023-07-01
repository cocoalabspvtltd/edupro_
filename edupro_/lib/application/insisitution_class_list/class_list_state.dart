part of 'class_list_bloc.dart';

@freezed
class ClassListState with _$ClassListState {
  const factory ClassListState.initial() = _Initial;
  const factory ClassListState.loadInProgress() = DataTransferInProgress;
  const factory ClassListState.loadMoreInProgress() = LoadMoreInProgress;
  const factory ClassListState.loadSuccess(response) = LoadSuccess;
  const factory ClassListState.loadFailure(NetworkFailure networkFailure) =
  LoadFailure;
}
