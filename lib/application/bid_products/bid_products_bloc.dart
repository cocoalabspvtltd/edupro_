import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/bid_products/i_bids_repository.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_detail_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/product_details_screen.dart';
part 'bid_products_event.dart';
part 'bid_products_state.dart';
part 'bid_products_bloc.freezed.dart';

class BidProductsBloc extends Bloc<BidProductsEvent, BidProductsState> {
  final IBidsRepository bidproductsRepository;
  BidProductsBloc(this.bidproductsRepository) : super( BidProductsState.initial()) {

    on<_LoadBidProducts>((event, emit) async {
      emit( BidProductsState.loadInProgress());
      Either<NetworkFailure, BidProductResponse> failureOrSuccess;

      failureOrSuccess = await bidproductsRepository.getBidsList();

      failureOrSuccess.fold((l) => emit(BidProductsState.loadFailure(l)),
              (r) => emit(BidProductsState.loadSuccess(r)));

    }
    );

    on<_LoadLiveProducts>((event, emit) async {
      emit( BidProductsState.loadInProgress());
      Either<NetworkFailure, BidProductResponse> failureOrSuccess;

      failureOrSuccess = await bidproductsRepository.getLiveProductsList();

      failureOrSuccess.fold((l) => emit(BidProductsState.loadFailure(l)),
              (r) => emit(BidProductsState.loadSuccess(r)));

    }
    );

    on<_LoadUpcomingProducts>((event, emit) async {
      emit( BidProductsState.loadInProgress());
      Either<NetworkFailure, BidProductResponse> failureOrSuccess;

      failureOrSuccess = await bidproductsRepository.getUpcomingProductsList();

      failureOrSuccess.fold((l) => emit(BidProductsState.loadFailure(l)),
              (r) => emit(BidProductsState.loadSuccess(r)));

    }
    );

    on<_LoadClosedProducts>((event, emit) async {
      emit( BidProductsState.loadInProgress());
      Either<NetworkFailure, BidProductResponse> failureOrSuccess;

      failureOrSuccess = await bidproductsRepository.getClosedProductsList();

      failureOrSuccess.fold((l) => emit(BidProductsState.loadFailure(l)),
              (r) => emit(BidProductsState.loadSuccess(r)));

    }
    );

    on<_LoadProductsDetails>((event, emit) async {
      emit( BidProductsState.loadInProgress());
      Either<NetworkFailure, BidProductDetailsResponse> failureOrSuccess;

      failureOrSuccess = await bidproductsRepository.getProductDetails(product_id);

      failureOrSuccess.fold((l) => emit(BidProductsState.loadFailure(l)),
              (r) => emit(BidProductsState.loadSuccess(r)));

    }
    );

  }
}
