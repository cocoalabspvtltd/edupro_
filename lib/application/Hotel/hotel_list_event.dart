part of 'hotel_list_bloc.dart';

@freezed
class HotelListEvent with _$HotelListEvent {
  const factory HotelListEvent.LoadHotels() = _LoadHotels;
}
