part of 'hotel_list_bloc.dart';

@freezed
class HotelListState with _$HotelListState {
  const factory HotelListState.initial() = _Initial;
  const factory HotelListState.loadInProgress() = DataTransferInProgress;
  const factory HotelListState.loadMoreInProgress() = LoadMoreInProgress;
  const factory HotelListState.loadSuccess(response) = LoadSuccess;
  const factory HotelListState.loadFailure(NetworkFailure networkFailure) =
  LoadFailure;
}
