import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/ads/i_ads_repository.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_event.dart';
part 'ads_state.dart';
part 'ads_bloc.freezed.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final IAdsRepository adsRepository;
  AdsBloc(this.adsRepository) : super(AdsState.initial()) {
    on<_GetAds>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        loadFailureOrSuccessOption: none(),
      ));

      Either<NetworkFailure, dynamic>? failureOrSuccess;

      failureOrSuccess = await adsRepository.getAds();
      //failureOrSuccess.fold((l) {}, ((r) => log("message")));

      emit(state.copyWith(
        isLoading: false,
        loadFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });
  }
}
