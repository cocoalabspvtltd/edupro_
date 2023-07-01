part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.startPayment(String amount, String paymentType,
      {int? courseId}) = _StartPayment;
}
