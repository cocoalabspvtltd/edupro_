// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_videos_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopVideosEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVideos,
    required TResult Function() loadMoreVideos,
    required TResult Function() refreshVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVideos,
    TResult? Function()? loadMoreVideos,
    TResult? Function()? refreshVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVideos,
    TResult Function()? loadMoreVideos,
    TResult Function()? refreshVideos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadVideos value) loadVideos,
    required TResult Function(_LoadMoreVideos value) loadMoreVideos,
    required TResult Function(_RefreshVideos value) refreshVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadVideos value)? loadVideos,
    TResult? Function(_LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(_RefreshVideos value)? refreshVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadVideos value)? loadVideos,
    TResult Function(_LoadMoreVideos value)? loadMoreVideos,
    TResult Function(_RefreshVideos value)? refreshVideos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopVideosEventCopyWith<$Res> {
  factory $TopVideosEventCopyWith(
          TopVideosEvent value, $Res Function(TopVideosEvent) then) =
      _$TopVideosEventCopyWithImpl<$Res, TopVideosEvent>;
}

/// @nodoc
class _$TopVideosEventCopyWithImpl<$Res, $Val extends TopVideosEvent>
    implements $TopVideosEventCopyWith<$Res> {
  _$TopVideosEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadVideosCopyWith<$Res> {
  factory _$$_LoadVideosCopyWith(
          _$_LoadVideos value, $Res Function(_$_LoadVideos) then) =
      __$$_LoadVideosCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadVideosCopyWithImpl<$Res>
    extends _$TopVideosEventCopyWithImpl<$Res, _$_LoadVideos>
    implements _$$_LoadVideosCopyWith<$Res> {
  __$$_LoadVideosCopyWithImpl(
      _$_LoadVideos _value, $Res Function(_$_LoadVideos) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadVideos implements _LoadVideos {
  const _$_LoadVideos();

  @override
  String toString() {
    return 'TopVideosEvent.loadVideos()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadVideos);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVideos,
    required TResult Function() loadMoreVideos,
    required TResult Function() refreshVideos,
  }) {
    return loadVideos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVideos,
    TResult? Function()? loadMoreVideos,
    TResult? Function()? refreshVideos,
  }) {
    return loadVideos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVideos,
    TResult Function()? loadMoreVideos,
    TResult Function()? refreshVideos,
    required TResult orElse(),
  }) {
    if (loadVideos != null) {
      return loadVideos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadVideos value) loadVideos,
    required TResult Function(_LoadMoreVideos value) loadMoreVideos,
    required TResult Function(_RefreshVideos value) refreshVideos,
  }) {
    return loadVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadVideos value)? loadVideos,
    TResult? Function(_LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(_RefreshVideos value)? refreshVideos,
  }) {
    return loadVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadVideos value)? loadVideos,
    TResult Function(_LoadMoreVideos value)? loadMoreVideos,
    TResult Function(_RefreshVideos value)? refreshVideos,
    required TResult orElse(),
  }) {
    if (loadVideos != null) {
      return loadVideos(this);
    }
    return orElse();
  }
}

abstract class _LoadVideos implements TopVideosEvent {
  const factory _LoadVideos() = _$_LoadVideos;
}

/// @nodoc
abstract class _$$_LoadMoreVideosCopyWith<$Res> {
  factory _$$_LoadMoreVideosCopyWith(
          _$_LoadMoreVideos value, $Res Function(_$_LoadMoreVideos) then) =
      __$$_LoadMoreVideosCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreVideosCopyWithImpl<$Res>
    extends _$TopVideosEventCopyWithImpl<$Res, _$_LoadMoreVideos>
    implements _$$_LoadMoreVideosCopyWith<$Res> {
  __$$_LoadMoreVideosCopyWithImpl(
      _$_LoadMoreVideos _value, $Res Function(_$_LoadMoreVideos) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadMoreVideos implements _LoadMoreVideos {
  const _$_LoadMoreVideos();

  @override
  String toString() {
    return 'TopVideosEvent.loadMoreVideos()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadMoreVideos);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVideos,
    required TResult Function() loadMoreVideos,
    required TResult Function() refreshVideos,
  }) {
    return loadMoreVideos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVideos,
    TResult? Function()? loadMoreVideos,
    TResult? Function()? refreshVideos,
  }) {
    return loadMoreVideos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVideos,
    TResult Function()? loadMoreVideos,
    TResult Function()? refreshVideos,
    required TResult orElse(),
  }) {
    if (loadMoreVideos != null) {
      return loadMoreVideos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadVideos value) loadVideos,
    required TResult Function(_LoadMoreVideos value) loadMoreVideos,
    required TResult Function(_RefreshVideos value) refreshVideos,
  }) {
    return loadMoreVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadVideos value)? loadVideos,
    TResult? Function(_LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(_RefreshVideos value)? refreshVideos,
  }) {
    return loadMoreVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadVideos value)? loadVideos,
    TResult Function(_LoadMoreVideos value)? loadMoreVideos,
    TResult Function(_RefreshVideos value)? refreshVideos,
    required TResult orElse(),
  }) {
    if (loadMoreVideos != null) {
      return loadMoreVideos(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreVideos implements TopVideosEvent {
  const factory _LoadMoreVideos() = _$_LoadMoreVideos;
}

/// @nodoc
abstract class _$$_RefreshVideosCopyWith<$Res> {
  factory _$$_RefreshVideosCopyWith(
          _$_RefreshVideos value, $Res Function(_$_RefreshVideos) then) =
      __$$_RefreshVideosCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshVideosCopyWithImpl<$Res>
    extends _$TopVideosEventCopyWithImpl<$Res, _$_RefreshVideos>
    implements _$$_RefreshVideosCopyWith<$Res> {
  __$$_RefreshVideosCopyWithImpl(
      _$_RefreshVideos _value, $Res Function(_$_RefreshVideos) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RefreshVideos implements _RefreshVideos {
  const _$_RefreshVideos();

  @override
  String toString() {
    return 'TopVideosEvent.refreshVideos()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RefreshVideos);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVideos,
    required TResult Function() loadMoreVideos,
    required TResult Function() refreshVideos,
  }) {
    return refreshVideos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVideos,
    TResult? Function()? loadMoreVideos,
    TResult? Function()? refreshVideos,
  }) {
    return refreshVideos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVideos,
    TResult Function()? loadMoreVideos,
    TResult Function()? refreshVideos,
    required TResult orElse(),
  }) {
    if (refreshVideos != null) {
      return refreshVideos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadVideos value) loadVideos,
    required TResult Function(_LoadMoreVideos value) loadMoreVideos,
    required TResult Function(_RefreshVideos value) refreshVideos,
  }) {
    return refreshVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadVideos value)? loadVideos,
    TResult? Function(_LoadMoreVideos value)? loadMoreVideos,
    TResult? Function(_RefreshVideos value)? refreshVideos,
  }) {
    return refreshVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadVideos value)? loadVideos,
    TResult Function(_LoadMoreVideos value)? loadMoreVideos,
    TResult Function(_RefreshVideos value)? refreshVideos,
    required TResult orElse(),
  }) {
    if (refreshVideos != null) {
      return refreshVideos(this);
    }
    return orElse();
  }
}

abstract class _RefreshVideos implements TopVideosEvent {
  const factory _RefreshVideos() = _$_RefreshVideos;
}

/// @nodoc
mixin _$TopVideosState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadMoreInProgress,
    required TResult Function(VideoResponse videoResponse) loadSuccess,
    required TResult Function(VideoFailure videoFailure) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(VideoResponse videoResponse)? loadSuccess,
    TResult? Function(VideoFailure videoFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(VideoResponse videoResponse)? loadSuccess,
    TResult Function(VideoFailure videoFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadMoreInProgress value) loadMoreInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DataTransferInProgress value)? loadInProgress,
    TResult? Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadMoreInProgress value)? loadMoreInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopVideosStateCopyWith<$Res> {
  factory $TopVideosStateCopyWith(
          TopVideosState value, $Res Function(TopVideosState) then) =
      _$TopVideosStateCopyWithImpl<$Res, TopVideosState>;
}

/// @nodoc
class _$TopVideosStateCopyWithImpl<$Res, $Val extends TopVideosState>
    implements $TopVideosStateCopyWith<$Res> {
  _$TopVideosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$TopVideosStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'TopVideosState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadMoreInProgress,
    required TResult Function(VideoResponse videoResponse) loadSuccess,
    required TResult Function(VideoFailure videoFailure) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(VideoResponse videoResponse)? loadSuccess,
    TResult? Function(VideoFailure videoFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(VideoResponse videoResponse)? loadSuccess,
    TResult Function(VideoFailure videoFailure)? loadFailure,
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
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
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

abstract class Initial implements TopVideosState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$DataTransferInProgressCopyWith<$Res> {
  factory _$$DataTransferInProgressCopyWith(_$DataTransferInProgress value,
          $Res Function(_$DataTransferInProgress) then) =
      __$$DataTransferInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DataTransferInProgressCopyWithImpl<$Res>
    extends _$TopVideosStateCopyWithImpl<$Res, _$DataTransferInProgress>
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
    return 'TopVideosState.loadInProgress()';
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
    required TResult Function(VideoResponse videoResponse) loadSuccess,
    required TResult Function(VideoFailure videoFailure) loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(VideoResponse videoResponse)? loadSuccess,
    TResult? Function(VideoFailure videoFailure)? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(VideoResponse videoResponse)? loadSuccess,
    TResult Function(VideoFailure videoFailure)? loadFailure,
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
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
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

abstract class DataTransferInProgress implements TopVideosState {
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
    extends _$TopVideosStateCopyWithImpl<$Res, _$LoadMoreInProgress>
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
    return 'TopVideosState.loadMoreInProgress()';
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
    required TResult Function(VideoResponse videoResponse) loadSuccess,
    required TResult Function(VideoFailure videoFailure) loadFailure,
  }) {
    return loadMoreInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(VideoResponse videoResponse)? loadSuccess,
    TResult? Function(VideoFailure videoFailure)? loadFailure,
  }) {
    return loadMoreInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(VideoResponse videoResponse)? loadSuccess,
    TResult Function(VideoFailure videoFailure)? loadFailure,
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
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
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

abstract class LoadMoreInProgress implements TopVideosState {
  const factory LoadMoreInProgress() = _$LoadMoreInProgress;
}

/// @nodoc
abstract class _$$LoadSuccessCopyWith<$Res> {
  factory _$$LoadSuccessCopyWith(
          _$LoadSuccess value, $Res Function(_$LoadSuccess) then) =
      __$$LoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({VideoResponse videoResponse});
}

/// @nodoc
class __$$LoadSuccessCopyWithImpl<$Res>
    extends _$TopVideosStateCopyWithImpl<$Res, _$LoadSuccess>
    implements _$$LoadSuccessCopyWith<$Res> {
  __$$LoadSuccessCopyWithImpl(
      _$LoadSuccess _value, $Res Function(_$LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoResponse = null,
  }) {
    return _then(_$LoadSuccess(
      null == videoResponse
          ? _value.videoResponse
          : videoResponse // ignore: cast_nullable_to_non_nullable
              as VideoResponse,
    ));
  }
}

/// @nodoc

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.videoResponse);

  @override
  final VideoResponse videoResponse;

  @override
  String toString() {
    return 'TopVideosState.loadSuccess(videoResponse: $videoResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccess &&
            (identical(other.videoResponse, videoResponse) ||
                other.videoResponse == videoResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoResponse);

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
    required TResult Function(VideoResponse videoResponse) loadSuccess,
    required TResult Function(VideoFailure videoFailure) loadFailure,
  }) {
    return loadSuccess(videoResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(VideoResponse videoResponse)? loadSuccess,
    TResult? Function(VideoFailure videoFailure)? loadFailure,
  }) {
    return loadSuccess?.call(videoResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(VideoResponse videoResponse)? loadSuccess,
    TResult Function(VideoFailure videoFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(videoResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
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

abstract class LoadSuccess implements TopVideosState {
  const factory LoadSuccess(final VideoResponse videoResponse) = _$LoadSuccess;

  VideoResponse get videoResponse;
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
  $Res call({VideoFailure videoFailure});

  $VideoFailureCopyWith<$Res> get videoFailure;
}

/// @nodoc
class __$$LoadFailureCopyWithImpl<$Res>
    extends _$TopVideosStateCopyWithImpl<$Res, _$LoadFailure>
    implements _$$LoadFailureCopyWith<$Res> {
  __$$LoadFailureCopyWithImpl(
      _$LoadFailure _value, $Res Function(_$LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoFailure = null,
  }) {
    return _then(_$LoadFailure(
      null == videoFailure
          ? _value.videoFailure
          : videoFailure // ignore: cast_nullable_to_non_nullable
              as VideoFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $VideoFailureCopyWith<$Res> get videoFailure {
    return $VideoFailureCopyWith<$Res>(_value.videoFailure, (value) {
      return _then(_value.copyWith(videoFailure: value));
    });
  }
}

/// @nodoc

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.videoFailure);

  @override
  final VideoFailure videoFailure;

  @override
  String toString() {
    return 'TopVideosState.loadFailure(videoFailure: $videoFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailure &&
            (identical(other.videoFailure, videoFailure) ||
                other.videoFailure == videoFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoFailure);

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
    required TResult Function(VideoResponse videoResponse) loadSuccess,
    required TResult Function(VideoFailure videoFailure) loadFailure,
  }) {
    return loadFailure(videoFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadMoreInProgress,
    TResult? Function(VideoResponse videoResponse)? loadSuccess,
    TResult? Function(VideoFailure videoFailure)? loadFailure,
  }) {
    return loadFailure?.call(videoFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadMoreInProgress,
    TResult Function(VideoResponse videoResponse)? loadSuccess,
    TResult Function(VideoFailure videoFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(videoFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
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
    TResult? Function(Initial value)? initial,
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
    TResult Function(Initial value)? initial,
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

abstract class LoadFailure implements TopVideosState {
  const factory LoadFailure(final VideoFailure videoFailure) = _$LoadFailure;

  VideoFailure get videoFailure;
  @JsonKey(ignore: true)
  _$$LoadFailureCopyWith<_$LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
