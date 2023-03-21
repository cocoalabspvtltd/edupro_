part of 'ads_bloc.dart';

@freezed
class AdsEvent with _$AdsEvent {
  const factory AdsEvent.started() = _Started;
  const factory AdsEvent.getAds() = _GetAds;
}
