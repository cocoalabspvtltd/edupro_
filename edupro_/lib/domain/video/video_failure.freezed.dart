// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(String errorCode) serverError,
    required TResult Function() serverTimeOut,
    required TResult Function() noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String errorCode)? serverError,
    TResult? Function()? serverTimeOut,
    TResult? Function()? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String errorCode)? serverError,
    TResult Function()? serverTimeOut,
    TResult Function()? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ServerTimeOut value) serverTimeOut,
    required TResult Function(NoData value) noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ServerTimeOut value)? serverTimeOut,
    TResult? Function(NoData value)? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(ServerError value)? serverError,
    TResult Function(ServerTimeOut value)? serverTimeOut,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoFailureCopyWith<$Res> {
  factory $VideoFailureCopyWith(
          VideoFailure value, $Res Function(VideoFailure) then) =
      _$VideoFailureCopyWithImpl<$Res, VideoFailure>;
}

/// @nodoc
class _$VideoFailureCopyWithImpl<$Res, $Val extends VideoFailure>
    implements $VideoFailureCopyWith<$Res> {
  _$VideoFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnexpectedCopyWith<$Res> {
  factory _$$UnexpectedCopyWith(
          _$Unexpected value, $Res Function(_$Unexpected) then) =
      __$$UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedCopyWithImpl<$Res>
    extends _$VideoFailureCopyWithImpl<$Res, _$Unexpected>
    implements _$$UnexpectedCopyWith<$Res> {
  __$$UnexpectedCopyWithImpl(
      _$Unexpected _value, $Res Function(_$Unexpected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unexpected implements Unexpected {
  const _$Unexpected();

  @override
  String toString() {
    return 'VideoFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(String errorCode) serverError,
    required TResult Function() serverTimeOut,
    required TResult Function() noData,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String errorCode)? serverError,
    TResult? Function()? serverTimeOut,
    TResult? Function()? noData,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String errorCode)? serverError,
    TResult Function()? serverTimeOut,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ServerTimeOut value) serverTimeOut,
    required TResult Function(NoData value) noData,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ServerTimeOut value)? serverTimeOut,
    TResult? Function(NoData value)? noData,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(ServerError value)? serverError,
    TResult Function(ServerTimeOut value)? serverTimeOut,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected implements VideoFailure {
  const factory Unexpected() = _$Unexpected;
}

/// @nodoc
abstract class _$$ServerErrorCopyWith<$Res> {
  factory _$$ServerErrorCopyWith(
          _$ServerError value, $Res Function(_$ServerError) then) =
      __$$ServerErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorCode});
}

/// @nodoc
class __$$ServerErrorCopyWithImpl<$Res>
    extends _$VideoFailureCopyWithImpl<$Res, _$ServerError>
    implements _$$ServerErrorCopyWith<$Res> {
  __$$ServerErrorCopyWithImpl(
      _$ServerError _value, $Res Function(_$ServerError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = null,
  }) {
    return _then(_$ServerError(
      null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError(this.errorCode);

  @override
  final String errorCode;

  @override
  String toString() {
    return 'VideoFailure.serverError(errorCode: $errorCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerError &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorCopyWith<_$ServerError> get copyWith =>
      __$$ServerErrorCopyWithImpl<_$ServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(String errorCode) serverError,
    required TResult Function() serverTimeOut,
    required TResult Function() noData,
  }) {
    return serverError(errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String errorCode)? serverError,
    TResult? Function()? serverTimeOut,
    TResult? Function()? noData,
  }) {
    return serverError?.call(errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String errorCode)? serverError,
    TResult Function()? serverTimeOut,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ServerTimeOut value) serverTimeOut,
    required TResult Function(NoData value) noData,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ServerTimeOut value)? serverTimeOut,
    TResult? Function(NoData value)? noData,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(ServerError value)? serverError,
    TResult Function(ServerTimeOut value)? serverTimeOut,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements VideoFailure {
  const factory ServerError(final String errorCode) = _$ServerError;

  String get errorCode;
  @JsonKey(ignore: true)
  _$$ServerErrorCopyWith<_$ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerTimeOutCopyWith<$Res> {
  factory _$$ServerTimeOutCopyWith(
          _$ServerTimeOut value, $Res Function(_$ServerTimeOut) then) =
      __$$ServerTimeOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerTimeOutCopyWithImpl<$Res>
    extends _$VideoFailureCopyWithImpl<$Res, _$ServerTimeOut>
    implements _$$ServerTimeOutCopyWith<$Res> {
  __$$ServerTimeOutCopyWithImpl(
      _$ServerTimeOut _value, $Res Function(_$ServerTimeOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerTimeOut implements ServerTimeOut {
  const _$ServerTimeOut();

  @override
  String toString() {
    return 'VideoFailure.serverTimeOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerTimeOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(String errorCode) serverError,
    required TResult Function() serverTimeOut,
    required TResult Function() noData,
  }) {
    return serverTimeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String errorCode)? serverError,
    TResult? Function()? serverTimeOut,
    TResult? Function()? noData,
  }) {
    return serverTimeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String errorCode)? serverError,
    TResult Function()? serverTimeOut,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (serverTimeOut != null) {
      return serverTimeOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ServerTimeOut value) serverTimeOut,
    required TResult Function(NoData value) noData,
  }) {
    return serverTimeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ServerTimeOut value)? serverTimeOut,
    TResult? Function(NoData value)? noData,
  }) {
    return serverTimeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(ServerError value)? serverError,
    TResult Function(ServerTimeOut value)? serverTimeOut,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) {
    if (serverTimeOut != null) {
      return serverTimeOut(this);
    }
    return orElse();
  }
}

abstract class ServerTimeOut implements VideoFailure {
  const factory ServerTimeOut() = _$ServerTimeOut;
}

/// @nodoc
abstract class _$$NoDataCopyWith<$Res> {
  factory _$$NoDataCopyWith(_$NoData value, $Res Function(_$NoData) then) =
      __$$NoDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoDataCopyWithImpl<$Res>
    extends _$VideoFailureCopyWithImpl<$Res, _$NoData>
    implements _$$NoDataCopyWith<$Res> {
  __$$NoDataCopyWithImpl(_$NoData _value, $Res Function(_$NoData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoData implements NoData {
  const _$NoData();

  @override
  String toString() {
    return 'VideoFailure.noData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(String errorCode) serverError,
    required TResult Function() serverTimeOut,
    required TResult Function() noData,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(String errorCode)? serverError,
    TResult? Function()? serverTimeOut,
    TResult? Function()? noData,
  }) {
    return noData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(String errorCode)? serverError,
    TResult Function()? serverTimeOut,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ServerTimeOut value) serverTimeOut,
    required TResult Function(NoData value) noData,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ServerTimeOut value)? serverTimeOut,
    TResult? Function(NoData value)? noData,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(ServerError value)? serverError,
    TResult Function(ServerTimeOut value)? serverTimeOut,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class NoData implements VideoFailure {
  const factory NoData() = _$NoData;
}
