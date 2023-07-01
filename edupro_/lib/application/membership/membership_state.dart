part of 'membership_bloc.dart';

@freezed
class MembershipState with _$MembershipState {
  const factory MembershipState({
    required bool isLoading,
    required Option<Either<NetworkFailure, MembershipDetailsResponse>>
        loadFailureOrSuccessOption,
  }) = _MembershipState;

  factory MembershipState.initial() => MembershipState(
        isLoading: false,
        loadFailureOrSuccessOption: none(),
      );
}
