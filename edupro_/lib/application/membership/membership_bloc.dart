import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/membership/i_membership_repository.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/membership/membership_details_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership_event.dart';
part 'membership_state.dart';
part 'membership_bloc.freezed.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final IMembershipRepository membershipRepository;
  MembershipBloc(this.membershipRepository) : super(MembershipState.initial()) {
    on<MembershipEvent>((event, emit) async {
      if (event is _LoadData) {
        emit(state.copyWith(
          isLoading: true,
          loadFailureOrSuccessOption: none(),
        ));

        Either<NetworkFailure, MembershipDetailsResponse>? failureOrSuccess;

        failureOrSuccess = await membershipRepository
            .getMembershipDetails(UserDetailsLocal.userId);
        failureOrSuccess.fold((l) {}, (r) async {
             try {
          var daysRemaining = int.parse(
              '${DateTime.parse(r.details?.expiryDate ?? '').difference(DateTime.now()).inDays}');
          await SharedPrefs.init();
          SharedPrefs.setString(
              'spSuscriptionPeriod', daysRemaining.toString());
           } catch (e) {
            toastMessage('suscription data failure; unexpected response');

            await SharedPrefs.init();
            SharedPrefs.setString('spSuscriptionPeriod', '0');
          }
        });

        emit(state.copyWith(
          isLoading: false,
          loadFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }
    });
  }
}
