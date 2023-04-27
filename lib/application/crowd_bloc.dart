import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/crowd.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/crowd_details.dart';

import '../domain/bid_products/i_bids_repository.dart';
import '../domain/core/network/network_failures.dart';

part 'crowd_event.dart';
part 'crowd_state.dart';
part 'crowd_bloc.freezed.dart';

class CrowdBloc extends Bloc<CrowdEvent, CrowdState> {
  final IBidsRepository bidproductsRepository;
  CrowdBloc(this.bidproductsRepository) : super( CrowdState.initial()) {

    on<_LoadCrowdProducts>((event, emit) async {
      emit( CrowdState.loadInProgress());
      Either<NetworkFailure, CrowdFundingResponse> failureOrSuccess;

      failureOrSuccess = await bidproductsRepository.getCrowdList();

      failureOrSuccess.fold((l) => emit(CrowdState.loadFailure(l)),
              (r) => emit(CrowdState.loadSuccess(r)));

    }

    );
    on<_LoadCrowdDetailsProducts>((event, emit) async {
      emit( CrowdState.loadInProgress());
      Either<NetworkFailure, CrowdFundingDetailsResponse> failureOrSuccess;

      failureOrSuccess = await bidproductsRepository.getCrowdDetailsList();

      failureOrSuccess.fold((l) => emit(CrowdState.loadFailure(l)),
              (r) => emit(CrowdState.loadSuccess(r)));

    });
  }
}
