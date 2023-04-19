import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/offers/i_offers_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/hotel_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/vouchers_list_response.dart';

part 'hotel_list_event.dart';
part 'hotel_list_state.dart';
part 'hotel_list_bloc.freezed.dart';

class HotelListBloc extends Bloc<HotelListEvent, HotelListState> {
  final IOffersRepository hotelRepository;
  HotelListBloc(this.hotelRepository) : super(const HotelListState.initial()) {

    on<_LoadHotels>((event, emit) async {
      emit( HotelListState.loadInProgress());
      Either<NetworkFailure, HotelListResponse> failureOrSuccess;

      failureOrSuccess = await hotelRepository.getHotelList();

      failureOrSuccess.fold((l) => emit(HotelListState.loadFailure(l)),
              (r) => emit(HotelListState.loadSuccess(r)));

    }
    );
    on<_LoadVouchers>((event, emit) async {
      emit( HotelListState.loadInProgress());
      Either<NetworkFailure, HotelListResponse> failureOrSuccess;

      failureOrSuccess = await hotelRepository.getVoucherList();

      failureOrSuccess.fold((l) => emit(HotelListState.loadFailure(l)),
              (r) => emit(HotelListState.loadSuccess(r)));

    }
    );
  }
}
