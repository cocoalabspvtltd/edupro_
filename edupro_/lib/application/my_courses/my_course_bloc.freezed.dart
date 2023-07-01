// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_course_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyCourseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCourseEventCopyWith<$Res> {
  factory $MyCourseEventCopyWith(
          MyCourseEvent value, $Res Function(MyCourseEvent) then) =
      _$MyCourseEventCopyWithImpl<$Res, MyCourseEvent>;
}

/// @nodoc
class _$MyCourseEventCopyWithImpl<$Res, $Val extends MyCourseEvent>
    implements $MyCourseEventCopyWith<$Res> {
  _$MyCourseEventCopyWithImpl(this._value, this._then);

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
    extends _$MyCourseEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'MyCourseEvent.started()';
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
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
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
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MyCourseEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_ChangeVideoToCopyWith<$Res> {
  factory _$$_ChangeVideoToCopyWith(
          _$_ChangeVideoTo value, $Res Function(_$_ChangeVideoTo) then) =
      __$$_ChangeVideoToCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_ChangeVideoToCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_ChangeVideoTo>
    implements _$$_ChangeVideoToCopyWith<$Res> {
  __$$_ChangeVideoToCopyWithImpl(
      _$_ChangeVideoTo _value, $Res Function(_$_ChangeVideoTo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_ChangeVideoTo(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeVideoTo implements _ChangeVideoTo {
  const _$_ChangeVideoTo(this.url);

  @override
  final String url;

  @override
  String toString() {
    return 'MyCourseEvent.changeVideoTo(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeVideoTo &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeVideoToCopyWith<_$_ChangeVideoTo> get copyWith =>
      __$$_ChangeVideoToCopyWithImpl<_$_ChangeVideoTo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return changeVideoTo(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return changeVideoTo?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (changeVideoTo != null) {
      return changeVideoTo(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return changeVideoTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return changeVideoTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (changeVideoTo != null) {
      return changeVideoTo(this);
    }
    return orElse();
  }
}

abstract class _ChangeVideoTo implements MyCourseEvent {
  const factory _ChangeVideoTo(final String url) = _$_ChangeVideoTo;

  String get url;
  @JsonKey(ignore: true)
  _$$_ChangeVideoToCopyWith<_$_ChangeVideoTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchVideosCopyWith<$Res> {
  factory _$$_FetchVideosCopyWith(
          _$_FetchVideos value, $Res Function(_$_FetchVideos) then) =
      __$$_FetchVideosCopyWithImpl<$Res>;
  @useResult
  $Res call({int courseId});
}

/// @nodoc
class __$$_FetchVideosCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_FetchVideos>
    implements _$$_FetchVideosCopyWith<$Res> {
  __$$_FetchVideosCopyWithImpl(
      _$_FetchVideos _value, $Res Function(_$_FetchVideos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_$_FetchVideos(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchVideos implements _FetchVideos {
  const _$_FetchVideos(this.courseId);

  @override
  final int courseId;

  @override
  String toString() {
    return 'MyCourseEvent.fetchVideos(courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchVideos &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchVideosCopyWith<_$_FetchVideos> get copyWith =>
      __$$_FetchVideosCopyWithImpl<_$_FetchVideos>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return fetchVideos(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return fetchVideos?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchVideos != null) {
      return fetchVideos(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return fetchVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return fetchVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchVideos != null) {
      return fetchVideos(this);
    }
    return orElse();
  }
}

abstract class _FetchVideos implements MyCourseEvent {
  const factory _FetchVideos(final int courseId) = _$_FetchVideos;

  int get courseId;
  @JsonKey(ignore: true)
  _$$_FetchVideosCopyWith<_$_FetchVideos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchAnnouncementsCopyWith<$Res> {
  factory _$$_FetchAnnouncementsCopyWith(_$_FetchAnnouncements value,
          $Res Function(_$_FetchAnnouncements) then) =
      __$$_FetchAnnouncementsCopyWithImpl<$Res>;
  @useResult
  $Res call({int courseId});
}

/// @nodoc
class __$$_FetchAnnouncementsCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_FetchAnnouncements>
    implements _$$_FetchAnnouncementsCopyWith<$Res> {
  __$$_FetchAnnouncementsCopyWithImpl(
      _$_FetchAnnouncements _value, $Res Function(_$_FetchAnnouncements) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_$_FetchAnnouncements(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchAnnouncements implements _FetchAnnouncements {
  const _$_FetchAnnouncements(this.courseId);

  @override
  final int courseId;

  @override
  String toString() {
    return 'MyCourseEvent.fetchAnnouncements(courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAnnouncements &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAnnouncementsCopyWith<_$_FetchAnnouncements> get copyWith =>
      __$$_FetchAnnouncementsCopyWithImpl<_$_FetchAnnouncements>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return fetchAnnouncements(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return fetchAnnouncements?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchAnnouncements != null) {
      return fetchAnnouncements(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return fetchAnnouncements(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return fetchAnnouncements?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchAnnouncements != null) {
      return fetchAnnouncements(this);
    }
    return orElse();
  }
}

abstract class _FetchAnnouncements implements MyCourseEvent {
  const factory _FetchAnnouncements(final int courseId) = _$_FetchAnnouncements;

  int get courseId;
  @JsonKey(ignore: true)
  _$$_FetchAnnouncementsCopyWith<_$_FetchAnnouncements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCertificateModelCopyWith<$Res> {
  factory _$$_FetchCertificateModelCopyWith(_$_FetchCertificateModel value,
          $Res Function(_$_FetchCertificateModel) then) =
      __$$_FetchCertificateModelCopyWithImpl<$Res>;
  @useResult
  $Res call({int courseId});
}

/// @nodoc
class __$$_FetchCertificateModelCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_FetchCertificateModel>
    implements _$$_FetchCertificateModelCopyWith<$Res> {
  __$$_FetchCertificateModelCopyWithImpl(_$_FetchCertificateModel _value,
      $Res Function(_$_FetchCertificateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_$_FetchCertificateModel(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchCertificateModel implements _FetchCertificateModel {
  const _$_FetchCertificateModel(this.courseId);

  @override
  final int courseId;

  @override
  String toString() {
    return 'MyCourseEvent.fetchCertificateModel(courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchCertificateModel &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCertificateModelCopyWith<_$_FetchCertificateModel> get copyWith =>
      __$$_FetchCertificateModelCopyWithImpl<_$_FetchCertificateModel>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return fetchCertificateModel(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return fetchCertificateModel?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchCertificateModel != null) {
      return fetchCertificateModel(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return fetchCertificateModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return fetchCertificateModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchCertificateModel != null) {
      return fetchCertificateModel(this);
    }
    return orElse();
  }
}

abstract class _FetchCertificateModel implements MyCourseEvent {
  const factory _FetchCertificateModel(final int courseId) =
      _$_FetchCertificateModel;

  int get courseId;
  @JsonKey(ignore: true)
  _$$_FetchCertificateModelCopyWith<_$_FetchCertificateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DownloadCertificateCopyWith<$Res> {
  factory _$$_DownloadCertificateCopyWith(_$_DownloadCertificate value,
          $Res Function(_$_DownloadCertificate) then) =
      __$$_DownloadCertificateCopyWithImpl<$Res>;
  @useResult
  $Res call({int userId, int courseId});
}

/// @nodoc
class __$$_DownloadCertificateCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_DownloadCertificate>
    implements _$$_DownloadCertificateCopyWith<$Res> {
  __$$_DownloadCertificateCopyWithImpl(_$_DownloadCertificate _value,
      $Res Function(_$_DownloadCertificate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? courseId = null,
  }) {
    return _then(_$_DownloadCertificate(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DownloadCertificate implements _DownloadCertificate {
  const _$_DownloadCertificate(this.userId, this.courseId);

  @override
  final int userId;
  @override
  final int courseId;

  @override
  String toString() {
    return 'MyCourseEvent.downloadCertificate(userId: $userId, courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadCertificate &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadCertificateCopyWith<_$_DownloadCertificate> get copyWith =>
      __$$_DownloadCertificateCopyWithImpl<_$_DownloadCertificate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return downloadCertificate(userId, courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return downloadCertificate?.call(userId, courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (downloadCertificate != null) {
      return downloadCertificate(userId, courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return downloadCertificate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return downloadCertificate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (downloadCertificate != null) {
      return downloadCertificate(this);
    }
    return orElse();
  }
}

abstract class _DownloadCertificate implements MyCourseEvent {
  const factory _DownloadCertificate(final int userId, final int courseId) =
      _$_DownloadCertificate;

  int get userId;
  int get courseId;
  @JsonKey(ignore: true)
  _$$_DownloadCertificateCopyWith<_$_DownloadCertificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchQuestionsCopyWith<$Res> {
  factory _$$_FetchQuestionsCopyWith(
          _$_FetchQuestions value, $Res Function(_$_FetchQuestions) then) =
      __$$_FetchQuestionsCopyWithImpl<$Res>;
  @useResult
  $Res call({int courseId});
}

/// @nodoc
class __$$_FetchQuestionsCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_FetchQuestions>
    implements _$$_FetchQuestionsCopyWith<$Res> {
  __$$_FetchQuestionsCopyWithImpl(
      _$_FetchQuestions _value, $Res Function(_$_FetchQuestions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_$_FetchQuestions(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchQuestions implements _FetchQuestions {
  const _$_FetchQuestions(this.courseId);

  @override
  final int courseId;

  @override
  String toString() {
    return 'MyCourseEvent.fetchQuestions(courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchQuestions &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchQuestionsCopyWith<_$_FetchQuestions> get copyWith =>
      __$$_FetchQuestionsCopyWithImpl<_$_FetchQuestions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return fetchQuestions(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return fetchQuestions?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchQuestions != null) {
      return fetchQuestions(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return fetchQuestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return fetchQuestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchQuestions != null) {
      return fetchQuestions(this);
    }
    return orElse();
  }
}

abstract class _FetchQuestions implements MyCourseEvent {
  const factory _FetchQuestions(final int courseId) = _$_FetchQuestions;

  int get courseId;
  @JsonKey(ignore: true)
  _$$_FetchQuestionsCopyWith<_$_FetchQuestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchAnswersCopyWith<$Res> {
  factory _$$_FetchAnswersCopyWith(
          _$_FetchAnswers value, $Res Function(_$_FetchAnswers) then) =
      __$$_FetchAnswersCopyWithImpl<$Res>;
  @useResult
  $Res call({int courseId, int questionId});
}

/// @nodoc
class __$$_FetchAnswersCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_FetchAnswers>
    implements _$$_FetchAnswersCopyWith<$Res> {
  __$$_FetchAnswersCopyWithImpl(
      _$_FetchAnswers _value, $Res Function(_$_FetchAnswers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? questionId = null,
  }) {
    return _then(_$_FetchAnswers(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
      null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchAnswers implements _FetchAnswers {
  const _$_FetchAnswers(this.courseId, this.questionId);

  @override
  final int courseId;
  @override
  final int questionId;

  @override
  String toString() {
    return 'MyCourseEvent.fetchAnswers(courseId: $courseId, questionId: $questionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAnswers &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId, questionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAnswersCopyWith<_$_FetchAnswers> get copyWith =>
      __$$_FetchAnswersCopyWithImpl<_$_FetchAnswers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return fetchAnswers(courseId, questionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return fetchAnswers?.call(courseId, questionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchAnswers != null) {
      return fetchAnswers(courseId, questionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return fetchAnswers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return fetchAnswers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (fetchAnswers != null) {
      return fetchAnswers(this);
    }
    return orElse();
  }
}

abstract class _FetchAnswers implements MyCourseEvent {
  const factory _FetchAnswers(final int courseId, final int questionId) =
      _$_FetchAnswers;

  int get courseId;
  int get questionId;
  @JsonKey(ignore: true)
  _$$_FetchAnswersCopyWith<_$_FetchAnswers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EnterQuestionTitleCopyWith<$Res> {
  factory _$$_EnterQuestionTitleCopyWith(_$_EnterQuestionTitle value,
          $Res Function(_$_EnterQuestionTitle) then) =
      __$$_EnterQuestionTitleCopyWithImpl<$Res>;
  @useResult
  $Res call({String questionTitle});
}

/// @nodoc
class __$$_EnterQuestionTitleCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_EnterQuestionTitle>
    implements _$$_EnterQuestionTitleCopyWith<$Res> {
  __$$_EnterQuestionTitleCopyWithImpl(
      _$_EnterQuestionTitle _value, $Res Function(_$_EnterQuestionTitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionTitle = null,
  }) {
    return _then(_$_EnterQuestionTitle(
      null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EnterQuestionTitle implements _EnterQuestionTitle {
  const _$_EnterQuestionTitle(this.questionTitle);

  @override
  final String questionTitle;

  @override
  String toString() {
    return 'MyCourseEvent.enterQuestionTitle(questionTitle: $questionTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnterQuestionTitle &&
            (identical(other.questionTitle, questionTitle) ||
                other.questionTitle == questionTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnterQuestionTitleCopyWith<_$_EnterQuestionTitle> get copyWith =>
      __$$_EnterQuestionTitleCopyWithImpl<_$_EnterQuestionTitle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return enterQuestionTitle(questionTitle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return enterQuestionTitle?.call(questionTitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (enterQuestionTitle != null) {
      return enterQuestionTitle(questionTitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return enterQuestionTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return enterQuestionTitle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (enterQuestionTitle != null) {
      return enterQuestionTitle(this);
    }
    return orElse();
  }
}

abstract class _EnterQuestionTitle implements MyCourseEvent {
  const factory _EnterQuestionTitle(final String questionTitle) =
      _$_EnterQuestionTitle;

  String get questionTitle;
  @JsonKey(ignore: true)
  _$$_EnterQuestionTitleCopyWith<_$_EnterQuestionTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EnterQuestionSubjectCopyWith<$Res> {
  factory _$$_EnterQuestionSubjectCopyWith(_$_EnterQuestionSubject value,
          $Res Function(_$_EnterQuestionSubject) then) =
      __$$_EnterQuestionSubjectCopyWithImpl<$Res>;
  @useResult
  $Res call({String questionSubject});
}

/// @nodoc
class __$$_EnterQuestionSubjectCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_EnterQuestionSubject>
    implements _$$_EnterQuestionSubjectCopyWith<$Res> {
  __$$_EnterQuestionSubjectCopyWithImpl(_$_EnterQuestionSubject _value,
      $Res Function(_$_EnterQuestionSubject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionSubject = null,
  }) {
    return _then(_$_EnterQuestionSubject(
      null == questionSubject
          ? _value.questionSubject
          : questionSubject // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EnterQuestionSubject implements _EnterQuestionSubject {
  const _$_EnterQuestionSubject(this.questionSubject);

  @override
  final String questionSubject;

  @override
  String toString() {
    return 'MyCourseEvent.enterQuestionSubject(questionSubject: $questionSubject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnterQuestionSubject &&
            (identical(other.questionSubject, questionSubject) ||
                other.questionSubject == questionSubject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionSubject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnterQuestionSubjectCopyWith<_$_EnterQuestionSubject> get copyWith =>
      __$$_EnterQuestionSubjectCopyWithImpl<_$_EnterQuestionSubject>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return enterQuestionSubject(questionSubject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return enterQuestionSubject?.call(questionSubject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (enterQuestionSubject != null) {
      return enterQuestionSubject(questionSubject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return enterQuestionSubject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return enterQuestionSubject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (enterQuestionSubject != null) {
      return enterQuestionSubject(this);
    }
    return orElse();
  }
}

abstract class _EnterQuestionSubject implements MyCourseEvent {
  const factory _EnterQuestionSubject(final String questionSubject) =
      _$_EnterQuestionSubject;

  String get questionSubject;
  @JsonKey(ignore: true)
  _$$_EnterQuestionSubjectCopyWith<_$_EnterQuestionSubject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AskQuestionsCopyWith<$Res> {
  factory _$$_AskQuestionsCopyWith(
          _$_AskQuestions value, $Res Function(_$_AskQuestions) then) =
      __$$_AskQuestionsCopyWithImpl<$Res>;
  @useResult
  $Res call({int courseId, int userId});
}

/// @nodoc
class __$$_AskQuestionsCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_AskQuestions>
    implements _$$_AskQuestionsCopyWith<$Res> {
  __$$_AskQuestionsCopyWithImpl(
      _$_AskQuestions _value, $Res Function(_$_AskQuestions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? userId = null,
  }) {
    return _then(_$_AskQuestions(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AskQuestions implements _AskQuestions {
  const _$_AskQuestions(this.courseId, this.userId);

  @override
  final int courseId;
  @override
  final int userId;

  @override
  String toString() {
    return 'MyCourseEvent.askQuestions(courseId: $courseId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AskQuestions &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AskQuestionsCopyWith<_$_AskQuestions> get copyWith =>
      __$$_AskQuestionsCopyWithImpl<_$_AskQuestions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return askQuestions(courseId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return askQuestions?.call(courseId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (askQuestions != null) {
      return askQuestions(courseId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return askQuestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return askQuestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (askQuestions != null) {
      return askQuestions(this);
    }
    return orElse();
  }
}

abstract class _AskQuestions implements MyCourseEvent {
  const factory _AskQuestions(final int courseId, final int userId) =
      _$_AskQuestions;

  int get courseId;
  int get userId;
  @JsonKey(ignore: true)
  _$$_AskQuestionsCopyWith<_$_AskQuestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EnterAnswerCopyWith<$Res> {
  factory _$$_EnterAnswerCopyWith(
          _$_EnterAnswer value, $Res Function(_$_EnterAnswer) then) =
      __$$_EnterAnswerCopyWithImpl<$Res>;
  @useResult
  $Res call({String answer});
}

/// @nodoc
class __$$_EnterAnswerCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_EnterAnswer>
    implements _$$_EnterAnswerCopyWith<$Res> {
  __$$_EnterAnswerCopyWithImpl(
      _$_EnterAnswer _value, $Res Function(_$_EnterAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
  }) {
    return _then(_$_EnterAnswer(
      null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EnterAnswer implements _EnterAnswer {
  const _$_EnterAnswer(this.answer);

  @override
  final String answer;

  @override
  String toString() {
    return 'MyCourseEvent.enterAnswer(answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnterAnswer &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnterAnswerCopyWith<_$_EnterAnswer> get copyWith =>
      __$$_EnterAnswerCopyWithImpl<_$_EnterAnswer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return enterAnswer(answer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return enterAnswer?.call(answer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (enterAnswer != null) {
      return enterAnswer(answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return enterAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return enterAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (enterAnswer != null) {
      return enterAnswer(this);
    }
    return orElse();
  }
}

abstract class _EnterAnswer implements MyCourseEvent {
  const factory _EnterAnswer(final String answer) = _$_EnterAnswer;

  String get answer;
  @JsonKey(ignore: true)
  _$$_EnterAnswerCopyWith<_$_EnterAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitAnswerCopyWith<$Res> {
  factory _$$_SubmitAnswerCopyWith(
          _$_SubmitAnswer value, $Res Function(_$_SubmitAnswer) then) =
      __$$_SubmitAnswerCopyWithImpl<$Res>;
  @useResult
  $Res call({int questionId, int userId, int courseId});
}

/// @nodoc
class __$$_SubmitAnswerCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_SubmitAnswer>
    implements _$$_SubmitAnswerCopyWith<$Res> {
  __$$_SubmitAnswerCopyWithImpl(
      _$_SubmitAnswer _value, $Res Function(_$_SubmitAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? userId = null,
    Object? courseId = null,
  }) {
    return _then(_$_SubmitAnswer(
      null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SubmitAnswer implements _SubmitAnswer {
  const _$_SubmitAnswer(this.questionId, this.userId, this.courseId);

  @override
  final int questionId;
  @override
  final int userId;
  @override
  final int courseId;

  @override
  String toString() {
    return 'MyCourseEvent.submitAnswer(questionId: $questionId, userId: $userId, courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitAnswer &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, userId, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitAnswerCopyWith<_$_SubmitAnswer> get copyWith =>
      __$$_SubmitAnswerCopyWithImpl<_$_SubmitAnswer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return submitAnswer(questionId, userId, courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return submitAnswer?.call(questionId, userId, courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (submitAnswer != null) {
      return submitAnswer(questionId, userId, courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return submitAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return submitAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (submitAnswer != null) {
      return submitAnswer(this);
    }
    return orElse();
  }
}

abstract class _SubmitAnswer implements MyCourseEvent {
  const factory _SubmitAnswer(
          final int questionId, final int userId, final int courseId) =
      _$_SubmitAnswer;

  int get questionId;
  int get userId;
  int get courseId;
  @JsonKey(ignore: true)
  _$$_SubmitAnswerCopyWith<_$_SubmitAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteAnswerCopyWith<$Res> {
  factory _$$_DeleteAnswerCopyWith(
          _$_DeleteAnswer value, $Res Function(_$_DeleteAnswer) then) =
      __$$_DeleteAnswerCopyWithImpl<$Res>;
  @useResult
  $Res call({int questionId, int answerId, int courseId});
}

/// @nodoc
class __$$_DeleteAnswerCopyWithImpl<$Res>
    extends _$MyCourseEventCopyWithImpl<$Res, _$_DeleteAnswer>
    implements _$$_DeleteAnswerCopyWith<$Res> {
  __$$_DeleteAnswerCopyWithImpl(
      _$_DeleteAnswer _value, $Res Function(_$_DeleteAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? answerId = null,
    Object? courseId = null,
  }) {
    return _then(_$_DeleteAnswer(
      null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int,
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeleteAnswer implements _DeleteAnswer {
  const _$_DeleteAnswer(this.questionId, this.answerId, this.courseId);

  @override
  final int questionId;
  @override
  final int answerId;
  @override
  final int courseId;

  @override
  String toString() {
    return 'MyCourseEvent.deleteAnswer(questionId: $questionId, answerId: $answerId, courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteAnswer &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, answerId, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteAnswerCopyWith<_$_DeleteAnswer> get copyWith =>
      __$$_DeleteAnswerCopyWithImpl<_$_DeleteAnswer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url) changeVideoTo,
    required TResult Function(int courseId) fetchVideos,
    required TResult Function(int courseId) fetchAnnouncements,
    required TResult Function(int courseId) fetchCertificateModel,
    required TResult Function(int userId, int courseId) downloadCertificate,
    required TResult Function(int courseId) fetchQuestions,
    required TResult Function(int courseId, int questionId) fetchAnswers,
    required TResult Function(String questionTitle) enterQuestionTitle,
    required TResult Function(String questionSubject) enterQuestionSubject,
    required TResult Function(int courseId, int userId) askQuestions,
    required TResult Function(String answer) enterAnswer,
    required TResult Function(int questionId, int userId, int courseId)
        submitAnswer,
    required TResult Function(int questionId, int answerId, int courseId)
        deleteAnswer,
  }) {
    return deleteAnswer(questionId, answerId, courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url)? changeVideoTo,
    TResult? Function(int courseId)? fetchVideos,
    TResult? Function(int courseId)? fetchAnnouncements,
    TResult? Function(int courseId)? fetchCertificateModel,
    TResult? Function(int userId, int courseId)? downloadCertificate,
    TResult? Function(int courseId)? fetchQuestions,
    TResult? Function(int courseId, int questionId)? fetchAnswers,
    TResult? Function(String questionTitle)? enterQuestionTitle,
    TResult? Function(String questionSubject)? enterQuestionSubject,
    TResult? Function(int courseId, int userId)? askQuestions,
    TResult? Function(String answer)? enterAnswer,
    TResult? Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult? Function(int questionId, int answerId, int courseId)? deleteAnswer,
  }) {
    return deleteAnswer?.call(questionId, answerId, courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url)? changeVideoTo,
    TResult Function(int courseId)? fetchVideos,
    TResult Function(int courseId)? fetchAnnouncements,
    TResult Function(int courseId)? fetchCertificateModel,
    TResult Function(int userId, int courseId)? downloadCertificate,
    TResult Function(int courseId)? fetchQuestions,
    TResult Function(int courseId, int questionId)? fetchAnswers,
    TResult Function(String questionTitle)? enterQuestionTitle,
    TResult Function(String questionSubject)? enterQuestionSubject,
    TResult Function(int courseId, int userId)? askQuestions,
    TResult Function(String answer)? enterAnswer,
    TResult Function(int questionId, int userId, int courseId)? submitAnswer,
    TResult Function(int questionId, int answerId, int courseId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (deleteAnswer != null) {
      return deleteAnswer(questionId, answerId, courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeVideoTo value) changeVideoTo,
    required TResult Function(_FetchVideos value) fetchVideos,
    required TResult Function(_FetchAnnouncements value) fetchAnnouncements,
    required TResult Function(_FetchCertificateModel value)
        fetchCertificateModel,
    required TResult Function(_DownloadCertificate value) downloadCertificate,
    required TResult Function(_FetchQuestions value) fetchQuestions,
    required TResult Function(_FetchAnswers value) fetchAnswers,
    required TResult Function(_EnterQuestionTitle value) enterQuestionTitle,
    required TResult Function(_EnterQuestionSubject value) enterQuestionSubject,
    required TResult Function(_AskQuestions value) askQuestions,
    required TResult Function(_EnterAnswer value) enterAnswer,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_DeleteAnswer value) deleteAnswer,
  }) {
    return deleteAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeVideoTo value)? changeVideoTo,
    TResult? Function(_FetchVideos value)? fetchVideos,
    TResult? Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult? Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult? Function(_DownloadCertificate value)? downloadCertificate,
    TResult? Function(_FetchQuestions value)? fetchQuestions,
    TResult? Function(_FetchAnswers value)? fetchAnswers,
    TResult? Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult? Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult? Function(_AskQuestions value)? askQuestions,
    TResult? Function(_EnterAnswer value)? enterAnswer,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_DeleteAnswer value)? deleteAnswer,
  }) {
    return deleteAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeVideoTo value)? changeVideoTo,
    TResult Function(_FetchVideos value)? fetchVideos,
    TResult Function(_FetchAnnouncements value)? fetchAnnouncements,
    TResult Function(_FetchCertificateModel value)? fetchCertificateModel,
    TResult Function(_DownloadCertificate value)? downloadCertificate,
    TResult Function(_FetchQuestions value)? fetchQuestions,
    TResult Function(_FetchAnswers value)? fetchAnswers,
    TResult Function(_EnterQuestionTitle value)? enterQuestionTitle,
    TResult Function(_EnterQuestionSubject value)? enterQuestionSubject,
    TResult Function(_AskQuestions value)? askQuestions,
    TResult Function(_EnterAnswer value)? enterAnswer,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_DeleteAnswer value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (deleteAnswer != null) {
      return deleteAnswer(this);
    }
    return orElse();
  }
}

abstract class _DeleteAnswer implements MyCourseEvent {
  const factory _DeleteAnswer(
          final int questionId, final int answerId, final int courseId) =
      _$_DeleteAnswer;

  int get questionId;
  int get answerId;
  int get courseId;
  @JsonKey(ignore: true)
  _$$_DeleteAnswerCopyWith<_$_DeleteAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MyCourseState {
  String get videoUrl => throw _privateConstructorUsedError;
  bool get isVideoLoading => throw _privateConstructorUsedError;
  bool get isFetchingData => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String get questionTitle => throw _privateConstructorUsedError;
  String get questionSubject => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  Option<Either<NetworkFailure, dynamic>> get loadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<NetworkFailure, dynamic>> get submitFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyCourseStateCopyWith<MyCourseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCourseStateCopyWith<$Res> {
  factory $MyCourseStateCopyWith(
          MyCourseState value, $Res Function(MyCourseState) then) =
      _$MyCourseStateCopyWithImpl<$Res, MyCourseState>;
  @useResult
  $Res call(
      {String videoUrl,
      bool isVideoLoading,
      bool isFetchingData,
      bool isSubmitting,
      String questionTitle,
      String questionSubject,
      String answer,
      Option<Either<NetworkFailure, dynamic>> loadFailureOrSuccessOption,
      Option<Either<NetworkFailure, dynamic>> submitFailureOrSuccessOption});
}

/// @nodoc
class _$MyCourseStateCopyWithImpl<$Res, $Val extends MyCourseState>
    implements $MyCourseStateCopyWith<$Res> {
  _$MyCourseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? isVideoLoading = null,
    Object? isFetchingData = null,
    Object? isSubmitting = null,
    Object? questionTitle = null,
    Object? questionSubject = null,
    Object? answer = null,
    Object? loadFailureOrSuccessOption = null,
    Object? submitFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isVideoLoading: null == isVideoLoading
          ? _value.isVideoLoading
          : isVideoLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingData: null == isFetchingData
          ? _value.isFetchingData
          : isFetchingData // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      questionTitle: null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      questionSubject: null == questionSubject
          ? _value.questionSubject
          : questionSubject // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, dynamic>>,
      submitFailureOrSuccessOption: null == submitFailureOrSuccessOption
          ? _value.submitFailureOrSuccessOption
          : submitFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyCourseStateCopyWith<$Res>
    implements $MyCourseStateCopyWith<$Res> {
  factory _$$_MyCourseStateCopyWith(
          _$_MyCourseState value, $Res Function(_$_MyCourseState) then) =
      __$$_MyCourseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String videoUrl,
      bool isVideoLoading,
      bool isFetchingData,
      bool isSubmitting,
      String questionTitle,
      String questionSubject,
      String answer,
      Option<Either<NetworkFailure, dynamic>> loadFailureOrSuccessOption,
      Option<Either<NetworkFailure, dynamic>> submitFailureOrSuccessOption});
}

/// @nodoc
class __$$_MyCourseStateCopyWithImpl<$Res>
    extends _$MyCourseStateCopyWithImpl<$Res, _$_MyCourseState>
    implements _$$_MyCourseStateCopyWith<$Res> {
  __$$_MyCourseStateCopyWithImpl(
      _$_MyCourseState _value, $Res Function(_$_MyCourseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? isVideoLoading = null,
    Object? isFetchingData = null,
    Object? isSubmitting = null,
    Object? questionTitle = null,
    Object? questionSubject = null,
    Object? answer = null,
    Object? loadFailureOrSuccessOption = null,
    Object? submitFailureOrSuccessOption = null,
  }) {
    return _then(_$_MyCourseState(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isVideoLoading: null == isVideoLoading
          ? _value.isVideoLoading
          : isVideoLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingData: null == isFetchingData
          ? _value.isFetchingData
          : isFetchingData // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      questionTitle: null == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      questionSubject: null == questionSubject
          ? _value.questionSubject
          : questionSubject // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, dynamic>>,
      submitFailureOrSuccessOption: null == submitFailureOrSuccessOption
          ? _value.submitFailureOrSuccessOption
          : submitFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_MyCourseState implements _MyCourseState {
  const _$_MyCourseState(
      {required this.videoUrl,
      required this.isVideoLoading,
      required this.isFetchingData,
      required this.isSubmitting,
      required this.questionTitle,
      required this.questionSubject,
      required this.answer,
      required this.loadFailureOrSuccessOption,
      required this.submitFailureOrSuccessOption});

  @override
  final String videoUrl;
  @override
  final bool isVideoLoading;
  @override
  final bool isFetchingData;
  @override
  final bool isSubmitting;
  @override
  final String questionTitle;
  @override
  final String questionSubject;
  @override
  final String answer;
  @override
  final Option<Either<NetworkFailure, dynamic>> loadFailureOrSuccessOption;
  @override
  final Option<Either<NetworkFailure, dynamic>> submitFailureOrSuccessOption;

  @override
  String toString() {
    return 'MyCourseState(videoUrl: $videoUrl, isVideoLoading: $isVideoLoading, isFetchingData: $isFetchingData, isSubmitting: $isSubmitting, questionTitle: $questionTitle, questionSubject: $questionSubject, answer: $answer, loadFailureOrSuccessOption: $loadFailureOrSuccessOption, submitFailureOrSuccessOption: $submitFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyCourseState &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.isVideoLoading, isVideoLoading) ||
                other.isVideoLoading == isVideoLoading) &&
            (identical(other.isFetchingData, isFetchingData) ||
                other.isFetchingData == isFetchingData) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.questionTitle, questionTitle) ||
                other.questionTitle == questionTitle) &&
            (identical(other.questionSubject, questionSubject) ||
                other.questionSubject == questionSubject) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.loadFailureOrSuccessOption,
                    loadFailureOrSuccessOption) ||
                other.loadFailureOrSuccessOption ==
                    loadFailureOrSuccessOption) &&
            (identical(other.submitFailureOrSuccessOption,
                    submitFailureOrSuccessOption) ||
                other.submitFailureOrSuccessOption ==
                    submitFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoUrl,
      isVideoLoading,
      isFetchingData,
      isSubmitting,
      questionTitle,
      questionSubject,
      answer,
      loadFailureOrSuccessOption,
      submitFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyCourseStateCopyWith<_$_MyCourseState> get copyWith =>
      __$$_MyCourseStateCopyWithImpl<_$_MyCourseState>(this, _$identity);
}

abstract class _MyCourseState implements MyCourseState {
  const factory _MyCourseState(
      {required final String videoUrl,
      required final bool isVideoLoading,
      required final bool isFetchingData,
      required final bool isSubmitting,
      required final String questionTitle,
      required final String questionSubject,
      required final String answer,
      required final Option<Either<NetworkFailure, dynamic>>
          loadFailureOrSuccessOption,
      required final Option<Either<NetworkFailure, dynamic>>
          submitFailureOrSuccessOption}) = _$_MyCourseState;

  @override
  String get videoUrl;
  @override
  bool get isVideoLoading;
  @override
  bool get isFetchingData;
  @override
  bool get isSubmitting;
  @override
  String get questionTitle;
  @override
  String get questionSubject;
  @override
  String get answer;
  @override
  Option<Either<NetworkFailure, dynamic>> get loadFailureOrSuccessOption;
  @override
  Option<Either<NetworkFailure, dynamic>> get submitFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_MyCourseStateCopyWith<_$_MyCourseState> get copyWith =>
      throw _privateConstructorUsedError;
}
