part of 'bid_products_bloc.dart';

@freezed
class BidProductsState with _$BidProductsState {
  const factory BidProductsState.initial() = _Initial;
  const factory BidProductsState.loadInProgress() = DataTransferInProgress;
  const factory BidProductsState.loadMoreInProgress() = LoadMoreInProgress;
  const factory BidProductsState.loadSuccess(response) = LoadSuccess;
  const factory BidProductsState.loadFailure(NetworkFailure networkFailure) =
  LoadFailure;
}
