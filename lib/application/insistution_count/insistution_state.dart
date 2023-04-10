part of 'insistution_bloc.dart';


@freezed
class InsistutionState with _$InsistutionState {
  const factory InsistutionState.initial() = Initial;
  const factory InsistutionState.loadInProgress() = DataTransferInProgress;
  const factory InsistutionState.loadMoreInProgress() = LoadMoreInProgress;
  const factory InsistutionState.loadSuccess(response) = LoadSuccess;
  const factory InsistutionState.loadFailure(NetworkFailure networkFailure) =
  LoadFailure;
}
