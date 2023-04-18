part of 'department_list_bloc.dart';

@freezed
class DepartmentListState with _$DepartmentListState {
  const factory DepartmentListState.initial() = _Initial;
  const factory DepartmentListState.loadInProgress() = DataTransferInProgress;
  const factory DepartmentListState.loadMoreInProgress() = LoadMoreInProgress;
  const factory DepartmentListState.loadSuccess(response) = LoadSuccess;
  const factory DepartmentListState.loadFailure(NetworkFailure networkFailure) =
  LoadFailure;
}
