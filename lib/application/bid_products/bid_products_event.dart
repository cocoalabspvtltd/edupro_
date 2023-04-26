part of 'bid_products_bloc.dart';

@freezed
class BidProductsEvent with _$BidProductsEvent {
  const factory BidProductsEvent.LoadBidProducts() = _LoadBidProducts;
}
