// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAds value) getAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAds value)? getAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAds value)? getAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsEventCopyWith<$Res> {
  factory $AdsEventCopyWith(AdsEvent value, $Res Function(AdsEvent) then) =
      _$AdsEventCopyWithImpl<$Res, AdsEvent>;
}

/// @nodoc
class _$AdsEventCopyWithImpl<$Res, $Val extends AdsEvent>
    implements $AdsEventCopyWith<$Res> {
  _$AdsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$AdsEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AdsEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAds,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAds,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAds,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAds value) getAds,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAds value)? getAds,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAds value)? getAds,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AdsEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_GetAdsCopyWith<$Res> {
  factory _$$_GetAdsCopyWith(_$_GetAds value, $Res Function(_$_GetAds) then) =
      __$$_GetAdsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetAdsCopyWithImpl<$Res>
    extends _$AdsEventCopyWithImpl<$Res, _$_GetAds>
    implements _$$_GetAdsCopyWith<$Res> {
  __$$_GetAdsCopyWithImpl(_$_GetAds _value, $Res Function(_$_GetAds) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetAds implements _GetAds {
  const _$_GetAds();

  @override
  String toString() {
    return 'AdsEvent.getAds()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetAds);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAds,
  }) {
    return getAds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAds,
  }) {
    return getAds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAds,
    required TResult orElse(),
  }) {
    if (getAds != null) {
      return getAds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAds value) getAds,
  }) {
    return getAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAds value)? getAds,
  }) {
    return getAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAds value)? getAds,
    required TResult orElse(),
  }) {
    if (getAds != null) {
      return getAds(this);
    }
    return orElse();
  }
}

abstract class _GetAds implements AdsEvent {
  const factory _GetAds() = _$_GetAds;
}

/// @nodoc
mixin _$AdsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<NetworkFailure, dynamic>> get loadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdsStateCopyWith<AdsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsStateCopyWith<$Res> {
  factory $AdsStateCopyWith(AdsState value, $Res Function(AdsState) then) =
      _$AdsStateCopyWithImpl<$Res, AdsState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<NetworkFailure, dynamic>> loadFailureOrSuccessOption});
}

/// @nodoc
class _$AdsStateCopyWithImpl<$Res, $Val extends AdsState>
    implements $AdsStateCopyWith<$Res> {
  _$AdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loadFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdsStateCopyWith<$Res> implements $AdsStateCopyWith<$Res> {
  factory _$$_AdsStateCopyWith(
          _$_AdsState value, $Res Function(_$_AdsState) then) =
      __$$_AdsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<NetworkFailure, dynamic>> loadFailureOrSuccessOption});
}

/// @nodoc
class __$$_AdsStateCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$_AdsState>
    implements _$$_AdsStateCopyWith<$Res> {
  __$$_AdsStateCopyWithImpl(
      _$_AdsState _value, $Res Function(_$_AdsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loadFailureOrSuccessOption = null,
  }) {
    return _then(_$_AdsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_AdsState implements _AdsState {
  const _$_AdsState(
      {required this.isLoading, required this.loadFailureOrSuccessOption});

  @override
  final bool isLoading;
  @override
  final Option<Either<NetworkFailure, dynamic>> loadFailureOrSuccessOption;

  @override
  String toString() {
    return 'AdsState(isLoading: $isLoading, loadFailureOrSuccessOption: $loadFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.loadFailureOrSuccessOption,
                    loadFailureOrSuccessOption) ||
                other.loadFailureOrSuccessOption ==
                    loadFailureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, loadFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdsStateCopyWith<_$_AdsState> get copyWith =>
      __$$_AdsStateCopyWithImpl<_$_AdsState>(this, _$identity);
}

abstract class _AdsState implements AdsState {
  const factory _AdsState(
      {required final bool isLoading,
      required final Option<Either<NetworkFailure, dynamic>>
          loadFailureOrSuccessOption}) = _$_AdsState;

  @override
  bool get isLoading;
  @override
  Option<Either<NetworkFailure, dynamic>> get loadFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AdsStateCopyWith<_$_AdsState> get copyWith =>
      throw _privateConstructorUsedError;
}
