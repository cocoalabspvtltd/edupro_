part of 'bid_products_bloc.dart';

@freezed
class BidProductsEvent with _$BidProductsEvent {
  const factory BidProductsEvent.LoadBidProducts() = _LoadBidProducts;
  const factory BidProductsEvent.LoadLiveProducts() = _LoadLiveProducts;
  const factory BidProductsEvent.LoadUpcomingProducts() = _LoadUpcomingProducts;
  const factory BidProductsEvent.LoadClosedProducts() = _LoadClosedProducts;
  const factory BidProductsEvent.LoadProductsDetails() = _LoadProductsDetails;
  const factory BidProductsEvent.LoadBidInstrctions() = _LoadBidInstrctions;
}
