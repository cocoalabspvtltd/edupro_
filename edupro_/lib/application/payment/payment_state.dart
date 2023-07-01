part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    required Option<Either<NetworkFailure, PaymentDataResponse>>
        getPaymentSuccessOrFailureOption,
  }) = _PaymentState;

  factory PaymentState.initial() => PaymentState(
        getPaymentSuccessOrFailureOption: none(),
      );
}
