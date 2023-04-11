part of 'all_categories_bloc.dart';

@freezed
class AllCategoriesState with _$AllCategoriesState {
  const factory AllCategoriesState.initial() = _Initial;
  const factory AllCategoriesState.loadInProgress() = DataTransferInProgress;
  const factory AllCategoriesState.loadMoreInProgress() = LoadMoreInProgress;
  const factory AllCategoriesState.loadSuccess(response) = LoadSuccess;
  const factory AllCategoriesState.loadFailure(NetworkFailure networkFailure) =
  LoadFailure;
}
