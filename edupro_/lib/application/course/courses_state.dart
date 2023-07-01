part of 'courses_bloc.dart';

@freezed
class CoursesState with _$CoursesState {
  const factory CoursesState.initial() = Initial;
  const factory CoursesState.loadInProgress() = DataTransferInProgress;
  const factory CoursesState.loadMoreInProgress() = LoadMoreInProgress;
  const factory CoursesState.loadSuccess(response) = LoadSuccess;
  const factory CoursesState.loadFailure(NetworkFailure networkFailure) =
      LoadFailure;
}
