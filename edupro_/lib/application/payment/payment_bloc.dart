import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/payment/i_payment_repository.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/common_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/payment/get_payment_data_response.dart';
import 'package:pgs_edupro/presentation/ui/auth/log_in/login_screen.dart';
import 'package:pgs_edupro/presentation/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'payment_event.dart';
part 'payment_state.dart';
part 'payment_bloc.freezed.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final IPaymentRepository paymentRepository;
  PaymentBloc(this.paymentRepository) : super(PaymentState.initial()) {
    on<_StartPayment>((event, emit) async {
      emit(
        state.copyWith(
          getPaymentSuccessOrFailureOption: none(),
        ),
      );
      Map body = {
        "user_id": UserDetailsLocal.userId,
        "amount": event.amount,
      };

      event.courseId != null ? body["course_id"] = event.courseId : null;
      Either<NetworkFailure, PaymentDataResponse>? failureOrSuccess;

      //AppDialogs.loading();
      failureOrSuccess = await paymentRepository.getPaymentData(body);
      //Get.back();

      failureOrSuccess.fold(
        (l) => null,
        (r) => _startPay(
          r.gateWayKey ?? '',
          r.orderId ?? '',
          double.parse(event.amount),
          event.paymentType,
          courseId: event.courseId,
        ),
      );

      emit(state.copyWith(
          getPaymentSuccessOrFailureOption: optionOf(failureOrSuccess)));
    });
  }

  _postPaymentId(String paymentId) async {
    Map body = {
      // "user_id": UserDetailsLocal.userId,
      "payment_id": paymentId,
    };
    Either<NetworkFailure, CommonResponse>? failureOrSuccess;

    failureOrSuccess = await paymentRepository.postPaymentId(body);
    failureOrSuccess.fold((l) => null, (r) => null);
  }

  late Razorpay _razorPay;

  _onPaymentSuccessFn(PaymentSuccessResponse paymentSuccessResponse) async {
    String msg = "Payment Success";
    Get.dialog(
      Center(
        child: Material(
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green.shade300,
                  size: 70,
                ),
                const SizedBox(height: 16),
                Text(
                  msg,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    await _postPaymentId(paymentSuccessResponse.paymentId!);
  }

  _onPaymentErrorFn(PaymentFailureResponse response) {
    String msg = '';
    if (response.code == Razorpay.PAYMENT_CANCELLED) {
      msg = 'Payment Has Been Cancelled';
    } else if (response.code == Razorpay.NETWORK_ERROR) {
      msg = 'Network Issues while payment request';
    } else {
      msg = 'Payment Error, Try after some time';
    }

    Get.dialog(
      Center(
        child: Material(
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.cancel_rounded,
                  color: Colors.red.shade300,
                  size: 70,
                ),
                const SizedBox(height: 16),
                Text(
                  msg,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _startPay(
    String key,
    String orderId,
    double amount,
    String paymentType, {
    int? courseId,
  }) async {
    _startPayment(
      key,
      amount.toString(),
      orderId,
      paymentType,
      courseId: courseId,
    );
  }

  _startPayment(String key, String amount, String orderId, String paymentType,
      {int? courseId}) {
    _razorPay = Razorpay();
    try {
      _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse paymentSuccessResponse) async {
        toastMessage('Payment successful');
        Get.back();
        if (paymentType == 'REGISTRATION') {
          await SharedPrefs.init();
          SharedPrefs.setString('spPaymentStatus', 'true');
          SharedPrefs.setString('spSuscriptionPeriod', '364');
          //await Future.delayed(const Duration(seconds: 2));
          Get.offAll(() => const HomeScreen());
        } else {
          Future.delayed(const Duration(milliseconds: 500), () {
            if (paymentSuccessResponse.paymentId != null) {
              Get.offAll(() => const HomeScreen(
                    selectedIndex: 1,
                  ));
            } // get to screen
          });
        }
        _onPaymentSuccessFn(paymentSuccessResponse);
      });
      _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse paymentFailureResponse) {
        if (paymentType == 'REGISTRATION') {
          Get.offAll(() => const LogInScreen());
        }
        _onPaymentErrorFn(paymentFailureResponse);
      });

      _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, (e) {});

      int amt = (double.parse(amount) * 100).floor();
      Map notes = {
        "type": paymentType,
        "user_id": UserDetailsLocal.userId,
        'order_id': orderId,
        "amount": amt
      };
      if (paymentType == 'COURSE PAYMENT') {
        notes['course_id'] = courseId;
      }

      var options = {
        'key': key,
        'order_id': orderId,
        'amount': amt,
        'name': "EDUPRO",
        'description': 'Payment',
        'retry': {'enabled': true, 'max_count': 3},
        'send_sms_hash': true,
        'prefill': {
          'contact': UserDetailsLocal.userMobile,
          'email': UserDetailsLocal.userEmail,
          'name': UserDetailsLocal.userName
        },
        'notes': notes,
        // 'external': {
        //   'wallets': ['paytm']
        // },
        "theme": {"color": "#550586"}
      };

      debugPrint(jsonEncode(options));

      _razorPay.open(options);
      return true;
    } catch (e, s) {
      Completer().completeError(e, s);
      toastMessage('Unable to start payment. Please try again');
      return false;
    }
  }
}
