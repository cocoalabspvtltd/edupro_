// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BidProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() LoadBidProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? LoadBidProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? LoadBidProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadBidProducts value) LoadBidProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadBidProducts value)? LoadBidProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadBidProducts value)? LoadBidProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BidProductsEventCopyWith<$Res> {
  factory $BidProductsEventCopyWith(
          BidProductsEvent value, $Res Function(BidProductsEvent) then) =
      _$BidProductsEventCopyWithImpl<$Res, BidProductsEvent>;
}

/// @nodoc
class _$BidProductsEventCopyWithImpl<$Res, $Val extends BidProductsEvent>
    implements $BidProductsEventCopyWith<$Res> {
  _$BidProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadBidProductsCopyWith<$Res> {
  factory _$$_LoadBidProductsCopyWith(
          _$_LoadBidProducts value, $Res Function(_$_LoadBidProducts) then) =
      __$$_LoadBidProductsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadBidProductsCopyWithImpl<$Res>
    extends _$BidProductsEventCopyWithImpl<$Res, _$_LoadBidProducts>
    implements _$$_LoadBidProductsCopyWith<$Res> {
  __$$_LoadBidProductsCopyWithImpl(
      _$_LoadBidProducts _value, $Res Function(_$_LoadBidProducts) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadBidProducts implements _LoadBidProducts {
  const _$_LoadBidProducts();

  @override
  String toString() {
    return 'BidProductsEvent.LoadBidProducts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadBidProducts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() LoadBidProducts,
  }) {
    return LoadBidProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? LoadBidProducts,
  }) {
    return LoadBidProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? LoadBidProducts,
    required TResult orElse(),
  }) {
    if (LoadBidProducts != null) {
      return LoadBidProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadBidProducts value) LoadBidProducts,
  }) {
    return LoadBidProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadBidProducts value)? LoadBidProducts,
  }) {
    return LoadBidProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadBidProducts value)? LoadBidProducts,
    required TResult orElse(),
  }) {
    if (LoadBidProducts != null) {
      return LoadBidProducts(this);
    }
    return orElse();
  }
}

abstract class _LoadBidProducts implements BidProductsEvent {
  const factory _LoadBidProducts() = _$_LoadBidProducts;
}

/// @nodoc
mixin _$BidProductsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadMoreInProgress,
    required TResult Function(dynamic response) loadSuccess,
    required TResult Function(NetworkFailure networkFailure) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(dynamic response)? loadSuccess,
    TResult? Function(NetworkFailure networkFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(dynamic response)? loadSuccess,
    TResult Function(NetworkFailure networkFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadMoreInProgress value) loadMoreInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DataTransferInProgress value)? loadInProgress,
    TResult? Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BidProductsStateCopyWith<$Res> {
  factory $BidProductsStateCopyWith(
          BidProductsState value, $Res Function(BidProductsState) then) =
      _$BidProductsStateCopyWithImpl<$Res, BidProductsState>;
}

/// @nodoc
class _$BidProductsStateCopyWithImpl<$Res, $Val extends BidProductsState>
    implements $BidProductsStateCopyWith<$Res> {
  _$BidProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$BidProductsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'BidProductsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadMoreInProgress,
    required TResult Function(dynamic response) loadSuccess,
    required TResult Function(NetworkFailure networkFailure) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(dynamic response)? loadSuccess,
    TResult? Function(NetworkFailure networkFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(dynamic response)? loadSuccess,
    TResult Function(NetworkFailure networkFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadMoreInProgress value) loadMoreInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DataTransferInProgress value)? loadInProgress,
    TResult? Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BidProductsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$DataTransferInProgressCopyWith<$Res> {
  factory _$$DataTransferInProgressCopyWith(_$DataTransferInProgress value,
          $Res Function(_$DataTransferInProgress) then) =
      __$$DataTransferInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DataTransferInProgressCopyWithImpl<$Res>
    extends _$BidProductsStateCopyWithImpl<$Res, _$DataTransferInProgress>
    implements _$$DataTransferInProgressCopyWith<$Res> {
  __$$DataTransferInProgressCopyWithImpl(_$DataTransferInProgress _value,
      $Res Function(_$DataTransferInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DataTransferInProgress implements DataTransferInProgress {
  const _$DataTransferInProgress();

  @override
  String toString() {
    return 'BidProductsState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DataTransferInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadMoreInProgress,
    required TResult Function(dynamic response) loadSuccess,
    required TResult Function(NetworkFailure networkFailure) loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(dynamic response)? loadSuccess,
    TResult? Function(NetworkFailure networkFailure)? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(dynamic response)? loadSuccess,
    TResult Function(NetworkFailure networkFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadMoreInProgress value) loadMoreInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DataTransferInProgress value)? loadInProgress,
    TResult? Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class DataTransferInProgress implements BidProductsState {
  const factory DataTransferInProgress() = _$DataTransferInProgress;
}

/// @nodoc
abstract class _$$LoadMoreInProgressCopyWith<$Res> {
  factory _$$LoadMoreInProgressCopyWith(_$LoadMoreInProgress value,
          $Res Function(_$LoadMoreInProgress) then) =
      __$$LoadMoreInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreInProgressCopyWithImpl<$Res>
    extends _$BidProductsStateCopyWithImpl<$Res, _$LoadMoreInProgress>
    implements _$$LoadMoreInProgressCopyWith<$Res> {
  __$$LoadMoreInProgressCopyWithImpl(
      _$LoadMoreInProgress _value, $Res Function(_$LoadMoreInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreInProgress implements LoadMoreInProgress {
  const _$LoadMoreInProgress();

  @override
  String toString() {
    return 'BidProductsState.loadMoreInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadMoreInProgress,
    required TResult Function(dynamic response) loadSuccess,
    required TResult Function(NetworkFailure networkFailure) loadFailure,
  }) {
    return loadMoreInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(dynamic response)? loadSuccess,
    TResult? Function(NetworkFailure networkFailure)? loadFailure,
  }) {
    return loadMoreInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(dynamic response)? loadSuccess,
    TResult Function(NetworkFailure networkFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadMoreInProgress != null) {
      return loadMoreInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadMoreInProgress value) loadMoreInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadMoreInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DataTransferInProgress value)? loadInProgress,
    TResult? Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
  }) {
    return loadMoreInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadMoreInProgress != null) {
      return loadMoreInProgress(this);
    }
    return orElse();
  }
}

abstract class LoadMoreInProgress implements BidProductsState {
  const factory LoadMoreInProgress() = _$LoadMoreInProgress;
}

/// @nodoc
abstract class _$$LoadSuccessCopyWith<$Res> {
  factory _$$LoadSuccessCopyWith(
          _$LoadSuccess value, $Res Function(_$LoadSuccess) then) =
      __$$LoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic response});
}

/// @nodoc
class __$$LoadSuccessCopyWithImpl<$Res>
    extends _$BidProductsStateCopyWithImpl<$Res, _$LoadSuccess>
    implements _$$LoadSuccessCopyWith<$Res> {
  __$$LoadSuccessCopyWithImpl(
      _$LoadSuccess _value, $Res Function(_$LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$LoadSuccess(
      freezed == response ? _value.response! : response,
    ));
  }
}

/// @nodoc

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.response);

  @override
  final dynamic response;

  @override
  String toString() {
    return 'BidProductsState.loadSuccess(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccess &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessCopyWith<_$LoadSuccess> get copyWith =>
      __$$LoadSuccessCopyWithImpl<_$LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadMoreInProgress,
    required TResult Function(dynamic response) loadSuccess,
    required TResult Function(NetworkFailure networkFailure) loadFailure,
  }) {
    return loadSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(dynamic response)? loadSuccess,
    TResult? Function(NetworkFailure networkFailure)? loadFailure,
  }) {
    return loadSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(dynamic response)? loadSuccess,
    TResult Function(NetworkFailure networkFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadMoreInProgress value) loadMoreInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DataTransferInProgress value)? loadInProgress,
    TResult? Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements BidProductsState {
  const factory LoadSuccess(final dynamic response) = _$LoadSuccess;

  dynamic get response;
  @JsonKey(ignore: true)
  _$$LoadSuccessCopyWith<_$LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureCopyWith<$Res> {
  factory _$$LoadFailureCopyWith(
          _$LoadFailure value, $Res Function(_$LoadFailure) then) =
      __$$LoadFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkFailure networkFailure});

  $NetworkFailureCopyWith<$Res> get networkFailure;
}

/// @nodoc
class __$$LoadFailureCopyWithImpl<$Res>
    extends _$BidProductsStateCopyWithImpl<$Res, _$LoadFailure>
    implements _$$LoadFailureCopyWith<$Res> {
  __$$LoadFailureCopyWithImpl(
      _$LoadFailure _value, $Res Function(_$LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkFailure = null,
  }) {
    return _then(_$LoadFailure(
      null == networkFailure
          ? _value.networkFailure
          : networkFailure // ignore: cast_nullable_to_non_nullable
              as NetworkFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkFailureCopyWith<$Res> get networkFailure {
    return $NetworkFailureCopyWith<$Res>(_value.networkFailure, (value) {
      return _then(_value.copyWith(networkFailure: value));
    });
  }
}

/// @nodoc

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.networkFailure);

  @override
  final NetworkFailure networkFailure;

  @override
  String toString() {
    return 'BidProductsState.loadFailure(networkFailure: $networkFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailure &&
            (identical(other.networkFailure, networkFailure) ||
                other.networkFailure == networkFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureCopyWith<_$LoadFailure> get copyWith =>
      __$$LoadFailureCopyWithImpl<_$LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadMoreInProgress,
    required TResult Function(dynamic response) loadSuccess,
    required TResult Function(NetworkFailure networkFailure) loadFailure,
  }) {
    return loadFailure(networkFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(dynamic response)? loadSuccess,
    TResult? Function(NetworkFailure networkFailure)? loadFailure,
  }) {
    return loadFailure?.call(networkFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(dynamic response)? loadSuccess,
    TResult Function(NetworkFailure networkFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(networkFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadMoreInProgress value) loadMoreInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DataTransferInProgress value)? loadInProgress,
    TResult? Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class LoadFailure implements BidProductsState {
  const factory LoadFailure(final NetworkFailure networkFailure) =
      _$LoadFailure;

  NetworkFailure get networkFailure;
  @JsonKey(ignore: true)
  _$$LoadFailureCopyWith<_$LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
