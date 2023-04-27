part of 'crowd_bloc.dart';

@freezed
class CrowdEvent with _$CrowdEvent {
  const factory CrowdEvent.LoadCrowdProducts() = _LoadCrowdProducts;
  const factory CrowdEvent.LoadCrowdDetilsProducts() = _LoadCrowdDetailsProducts;
}
