// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MembershipEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadData value) loadData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadData value)? loadData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadData value)? loadData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipEventCopyWith<$Res> {
  factory $MembershipEventCopyWith(
          MembershipEvent value, $Res Function(MembershipEvent) then) =
      _$MembershipEventCopyWithImpl<$Res, MembershipEvent>;
}

/// @nodoc
class _$MembershipEventCopyWithImpl<$Res, $Val extends MembershipEvent>
    implements $MembershipEventCopyWith<$Res> {
  _$MembershipEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadDataCopyWith<$Res> {
  factory _$$_LoadDataCopyWith(
          _$_LoadData value, $Res Function(_$_LoadData) then) =
      __$$_LoadDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadDataCopyWithImpl<$Res>
    extends _$MembershipEventCopyWithImpl<$Res, _$_LoadData>
    implements _$$_LoadDataCopyWith<$Res> {
  __$$_LoadDataCopyWithImpl(
      _$_LoadData _value, $Res Function(_$_LoadData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadData implements _LoadData {
  const _$_LoadData();

  @override
  String toString() {
    return 'MembershipEvent.loadData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
  }) {
    return loadData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
  }) {
    return loadData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadData value) loadData,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadData value)? loadData,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadData value)? loadData,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class _LoadData implements MembershipEvent {
  const factory _LoadData() = _$_LoadData;
}

/// @nodoc
mixin _$MembershipState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<NetworkFailure, MembershipDetailsResponse>>
      get loadFailureOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MembershipStateCopyWith<MembershipState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipStateCopyWith<$Res> {
  factory $MembershipStateCopyWith(
          MembershipState value, $Res Function(MembershipState) then) =
      _$MembershipStateCopyWithImpl<$Res, MembershipState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<NetworkFailure, MembershipDetailsResponse>>
          loadFailureOrSuccessOption});
}

/// @nodoc
class _$MembershipStateCopyWithImpl<$Res, $Val extends MembershipState>
    implements $MembershipStateCopyWith<$Res> {
  _$MembershipStateCopyWithImpl(this._value, this._then);

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
              as Option<Either<NetworkFailure, MembershipDetailsResponse>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MembershipStateCopyWith<$Res>
    implements $MembershipStateCopyWith<$Res> {
  factory _$$_MembershipStateCopyWith(
          _$_MembershipState value, $Res Function(_$_MembershipState) then) =
      __$$_MembershipStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<NetworkFailure, MembershipDetailsResponse>>
          loadFailureOrSuccessOption});
}

/// @nodoc
class __$$_MembershipStateCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res, _$_MembershipState>
    implements _$$_MembershipStateCopyWith<$Res> {
  __$$_MembershipStateCopyWithImpl(
      _$_MembershipState _value, $Res Function(_$_MembershipState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loadFailureOrSuccessOption = null,
  }) {
    return _then(_$_MembershipState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, MembershipDetailsResponse>>,
    ));
  }
}

/// @nodoc

class _$_MembershipState implements _MembershipState {
  const _$_MembershipState(
      {required this.isLoading, required this.loadFailureOrSuccessOption});

  @override
  final bool isLoading;
  @override
  final Option<Either<NetworkFailure, MembershipDetailsResponse>>
      loadFailureOrSuccessOption;

  @override
  String toString() {
    return 'MembershipState(isLoading: $isLoading, loadFailureOrSuccessOption: $loadFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MembershipState &&
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
  _$$_MembershipStateCopyWith<_$_MembershipState> get copyWith =>
      __$$_MembershipStateCopyWithImpl<_$_MembershipState>(this, _$identity);
}

abstract class _MembershipState implements MembershipState {
  const factory _MembershipState(
      {required final bool isLoading,
      required final Option<Either<NetworkFailure, MembershipDetailsResponse>>
          loadFailureOrSuccessOption}) = _$_MembershipState;

  @override
  bool get isLoading;
  @override
  Option<Either<NetworkFailure, MembershipDetailsResponse>>
      get loadFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_MembershipStateCopyWith<_$_MembershipState> get copyWith =>
      throw _privateConstructorUsedError;
}
