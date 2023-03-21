// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentEvent {
  String get amount => throw _privateConstructorUsedError;
  String get paymentType => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount, String paymentType, int? courseId)
        startPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount, String paymentType, int? courseId)?
        startPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount, String paymentType, int? courseId)?
        startPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartPayment value) startPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartPayment value)? startPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartPayment value)? startPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentEventCopyWith<PaymentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res, PaymentEvent>;
  @useResult
  $Res call({String amount, String paymentType, int? courseId});
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res, $Val extends PaymentEvent>
    implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? paymentType = null,
    Object? courseId = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartPaymentCopyWith<$Res>
    implements $PaymentEventCopyWith<$Res> {
  factory _$$_StartPaymentCopyWith(
          _$_StartPayment value, $Res Function(_$_StartPayment) then) =
      __$$_StartPaymentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String amount, String paymentType, int? courseId});
}

/// @nodoc
class __$$_StartPaymentCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$_StartPayment>
    implements _$$_StartPaymentCopyWith<$Res> {
  __$$_StartPaymentCopyWithImpl(
      _$_StartPayment _value, $Res Function(_$_StartPayment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? paymentType = null,
    Object? courseId = freezed,
  }) {
    return _then(_$_StartPayment(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_StartPayment implements _StartPayment {
  const _$_StartPayment(this.amount, this.paymentType, {this.courseId});

  @override
  final String amount;
  @override
  final String paymentType;
  @override
  final int? courseId;

  @override
  String toString() {
    return 'PaymentEvent.startPayment(amount: $amount, paymentType: $paymentType, courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartPayment &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, paymentType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartPaymentCopyWith<_$_StartPayment> get copyWith =>
      __$$_StartPaymentCopyWithImpl<_$_StartPayment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount, String paymentType, int? courseId)
        startPayment,
  }) {
    return startPayment(amount, paymentType, courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount, String paymentType, int? courseId)?
        startPayment,
  }) {
    return startPayment?.call(amount, paymentType, courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount, String paymentType, int? courseId)?
        startPayment,
    required TResult orElse(),
  }) {
    if (startPayment != null) {
      return startPayment(amount, paymentType, courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartPayment value) startPayment,
  }) {
    return startPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartPayment value)? startPayment,
  }) {
    return startPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartPayment value)? startPayment,
    required TResult orElse(),
  }) {
    if (startPayment != null) {
      return startPayment(this);
    }
    return orElse();
  }
}

abstract class _StartPayment implements PaymentEvent {
  const factory _StartPayment(final String amount, final String paymentType,
      {final int? courseId}) = _$_StartPayment;

  @override
  String get amount;
  @override
  String get paymentType;
  @override
  int? get courseId;
  @override
  @JsonKey(ignore: true)
  _$$_StartPaymentCopyWith<_$_StartPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentState {
  Option<Either<NetworkFailure, PaymentDataResponse>>
      get getPaymentSuccessOrFailureOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
  @useResult
  $Res call(
      {Option<Either<NetworkFailure, PaymentDataResponse>>
          getPaymentSuccessOrFailureOption});
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getPaymentSuccessOrFailureOption = null,
  }) {
    return _then(_value.copyWith(
      getPaymentSuccessOrFailureOption: null == getPaymentSuccessOrFailureOption
          ? _value.getPaymentSuccessOrFailureOption
          : getPaymentSuccessOrFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, PaymentDataResponse>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentStateCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$$_PaymentStateCopyWith(
          _$_PaymentState value, $Res Function(_$_PaymentState) then) =
      __$$_PaymentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<NetworkFailure, PaymentDataResponse>>
          getPaymentSuccessOrFailureOption});
}

/// @nodoc
class __$$_PaymentStateCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$_PaymentState>
    implements _$$_PaymentStateCopyWith<$Res> {
  __$$_PaymentStateCopyWithImpl(
      _$_PaymentState _value, $Res Function(_$_PaymentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getPaymentSuccessOrFailureOption = null,
  }) {
    return _then(_$_PaymentState(
      getPaymentSuccessOrFailureOption: null == getPaymentSuccessOrFailureOption
          ? _value.getPaymentSuccessOrFailureOption
          : getPaymentSuccessOrFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, PaymentDataResponse>>,
    ));
  }
}

/// @nodoc

class _$_PaymentState implements _PaymentState {
  const _$_PaymentState({required this.getPaymentSuccessOrFailureOption});

  @override
  final Option<Either<NetworkFailure, PaymentDataResponse>>
      getPaymentSuccessOrFailureOption;

  @override
  String toString() {
    return 'PaymentState(getPaymentSuccessOrFailureOption: $getPaymentSuccessOrFailureOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentState &&
            (identical(other.getPaymentSuccessOrFailureOption,
                    getPaymentSuccessOrFailureOption) ||
                other.getPaymentSuccessOrFailureOption ==
                    getPaymentSuccessOrFailureOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, getPaymentSuccessOrFailureOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentStateCopyWith<_$_PaymentState> get copyWith =>
      __$$_PaymentStateCopyWithImpl<_$_PaymentState>(this, _$identity);
}

abstract class _PaymentState implements PaymentState {
  const factory _PaymentState(
      {required final Option<Either<NetworkFailure, PaymentDataResponse>>
          getPaymentSuccessOrFailureOption}) = _$_PaymentState;

  @override
  Option<Either<NetworkFailure, PaymentDataResponse>>
      get getPaymentSuccessOrFailureOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentStateCopyWith<_$_PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
