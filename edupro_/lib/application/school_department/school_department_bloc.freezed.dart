// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_department_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SchoolDepartmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function() submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function()? submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String nameStr)? nameChanged,
    TResult Function()? submitPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolDepartmentEventCopyWith<$Res> {
  factory $SchoolDepartmentEventCopyWith(SchoolDepartmentEvent value,
          $Res Function(SchoolDepartmentEvent) then) =
      _$SchoolDepartmentEventCopyWithImpl<$Res, SchoolDepartmentEvent>;
}

/// @nodoc
class _$SchoolDepartmentEventCopyWithImpl<$Res,
        $Val extends SchoolDepartmentEvent>
    implements $SchoolDepartmentEventCopyWith<$Res> {
  _$SchoolDepartmentEventCopyWithImpl(this._value, this._then);

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
    extends _$SchoolDepartmentEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'SchoolDepartmentEvent.started()';
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
    required TResult Function(String nameStr) nameChanged,
    required TResult Function() submitPressed,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function()? submitPressed,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String nameStr)? nameChanged,
    TResult Function()? submitPressed,
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
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SchoolDepartmentEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_NameChangedCopyWith<$Res> {
  factory _$$_NameChangedCopyWith(
          _$_NameChanged value, $Res Function(_$_NameChanged) then) =
      __$$_NameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String nameStr});
}

/// @nodoc
class __$$_NameChangedCopyWithImpl<$Res>
    extends _$SchoolDepartmentEventCopyWithImpl<$Res, _$_NameChanged>
    implements _$$_NameChangedCopyWith<$Res> {
  __$$_NameChangedCopyWithImpl(
      _$_NameChanged _value, $Res Function(_$_NameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameStr = null,
  }) {
    return _then(_$_NameChanged(
      null == nameStr
          ? _value.nameStr
          : nameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.nameStr);

  @override
  final String nameStr;

  @override
  String toString() {
    return 'SchoolDepartmentEvent.nameChanged(nameStr: $nameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameChanged &&
            (identical(other.nameStr, nameStr) || other.nameStr == nameStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nameStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      __$$_NameChangedCopyWithImpl<_$_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function() submitPressed,
  }) {
    return nameChanged(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function()? submitPressed,
  }) {
    return nameChanged?.call(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String nameStr)? nameChanged,
    TResult Function()? submitPressed,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(nameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements SchoolDepartmentEvent {
  const factory _NameChanged(final String nameStr) = _$_NameChanged;

  String get nameStr;
  @JsonKey(ignore: true)
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitPressedCopyWith<$Res> {
  factory _$$_SubmitPressedCopyWith(
          _$_SubmitPressed value, $Res Function(_$_SubmitPressed) then) =
      __$$_SubmitPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmitPressedCopyWithImpl<$Res>
    extends _$SchoolDepartmentEventCopyWithImpl<$Res, _$_SubmitPressed>
    implements _$$_SubmitPressedCopyWith<$Res> {
  __$$_SubmitPressedCopyWithImpl(
      _$_SubmitPressed _value, $Res Function(_$_SubmitPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SubmitPressed implements _SubmitPressed {
  const _$_SubmitPressed();

  @override
  String toString() {
    return 'SchoolDepartmentEvent.submitPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SubmitPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function() submitPressed,
  }) {
    return submitPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function()? submitPressed,
  }) {
    return submitPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String nameStr)? nameChanged,
    TResult Function()? submitPressed,
    required TResult orElse(),
  }) {
    if (submitPressed != null) {
      return submitPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return submitPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return submitPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (submitPressed != null) {
      return submitPressed(this);
    }
    return orElse();
  }
}

abstract class _SubmitPressed implements SchoolDepartmentEvent {
  const factory _SubmitPressed() = _$_SubmitPressed;
}

/// @nodoc
mixin _$SchoolDepartmentState {
  TextEditingController get name => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<NetworkFailure, Unit>> get loadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<NetworkFailure, Unit>> get submitFailedOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SchoolDepartmentStateCopyWith<SchoolDepartmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolDepartmentStateCopyWith<$Res> {
  factory $SchoolDepartmentStateCopyWith(SchoolDepartmentState value,
          $Res Function(SchoolDepartmentState) then) =
      _$SchoolDepartmentStateCopyWithImpl<$Res, SchoolDepartmentState>;
  @useResult
  $Res call(
      {TextEditingController name,
      bool showErrorMessages,
      bool isLoading,
      bool isSubmitting,
      Option<Either<NetworkFailure, Unit>> loadFailureOrSuccessOption,
      Option<Either<NetworkFailure, Unit>> submitFailedOrSuccessOption});
}

/// @nodoc
class _$SchoolDepartmentStateCopyWithImpl<$Res,
        $Val extends SchoolDepartmentState>
    implements $SchoolDepartmentStateCopyWith<$Res> {
  _$SchoolDepartmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? showErrorMessages = null,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? loadFailureOrSuccessOption = null,
    Object? submitFailedOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, Unit>>,
      submitFailedOrSuccessOption: null == submitFailedOrSuccessOption
          ? _value.submitFailedOrSuccessOption
          : submitFailedOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchoolDepartmentStateCopyWith<$Res>
    implements $SchoolDepartmentStateCopyWith<$Res> {
  factory _$$_SchoolDepartmentStateCopyWith(_$_SchoolDepartmentState value,
          $Res Function(_$_SchoolDepartmentState) then) =
      __$$_SchoolDepartmentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController name,
      bool showErrorMessages,
      bool isLoading,
      bool isSubmitting,
      Option<Either<NetworkFailure, Unit>> loadFailureOrSuccessOption,
      Option<Either<NetworkFailure, Unit>> submitFailedOrSuccessOption});
}

/// @nodoc
class __$$_SchoolDepartmentStateCopyWithImpl<$Res>
    extends _$SchoolDepartmentStateCopyWithImpl<$Res, _$_SchoolDepartmentState>
    implements _$$_SchoolDepartmentStateCopyWith<$Res> {
  __$$_SchoolDepartmentStateCopyWithImpl(_$_SchoolDepartmentState _value,
      $Res Function(_$_SchoolDepartmentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? showErrorMessages = null,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? loadFailureOrSuccessOption = null,
    Object? submitFailedOrSuccessOption = null,
  }) {
    return _then(_$_SchoolDepartmentState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, Unit>>,
      submitFailedOrSuccessOption: null == submitFailedOrSuccessOption
          ? _value.submitFailedOrSuccessOption
          : submitFailedOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_SchoolDepartmentState implements _SchoolDepartmentState {
  const _$_SchoolDepartmentState(
      {required this.name,
      required this.showErrorMessages,
      required this.isLoading,
      required this.isSubmitting,
      required this.loadFailureOrSuccessOption,
      required this.submitFailedOrSuccessOption});

  @override
  final TextEditingController name;
  @override
  final bool showErrorMessages;
  @override
  final bool isLoading;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<NetworkFailure, Unit>> loadFailureOrSuccessOption;
  @override
  final Option<Either<NetworkFailure, Unit>> submitFailedOrSuccessOption;

  @override
  String toString() {
    return 'SchoolDepartmentState(name: $name, showErrorMessages: $showErrorMessages, isLoading: $isLoading, isSubmitting: $isSubmitting, loadFailureOrSuccessOption: $loadFailureOrSuccessOption, submitFailedOrSuccessOption: $submitFailedOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchoolDepartmentState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.loadFailureOrSuccessOption,
                    loadFailureOrSuccessOption) ||
                other.loadFailureOrSuccessOption ==
                    loadFailureOrSuccessOption) &&
            (identical(other.submitFailedOrSuccessOption,
                    submitFailedOrSuccessOption) ||
                other.submitFailedOrSuccessOption ==
                    submitFailedOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      showErrorMessages,
      isLoading,
      isSubmitting,
      loadFailureOrSuccessOption,
      submitFailedOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchoolDepartmentStateCopyWith<_$_SchoolDepartmentState> get copyWith =>
      __$$_SchoolDepartmentStateCopyWithImpl<_$_SchoolDepartmentState>(
          this, _$identity);
}

abstract class _SchoolDepartmentState implements SchoolDepartmentState {
  const factory _SchoolDepartmentState(
      {required final TextEditingController name,
      required final bool showErrorMessages,
      required final bool isLoading,
      required final bool isSubmitting,
      required final Option<Either<NetworkFailure, Unit>>
          loadFailureOrSuccessOption,
      required final Option<Either<NetworkFailure, Unit>>
          submitFailedOrSuccessOption}) = _$_SchoolDepartmentState;

  @override
  TextEditingController get name;
  @override
  bool get showErrorMessages;
  @override
  bool get isLoading;
  @override
  bool get isSubmitting;
  @override
  Option<Either<NetworkFailure, Unit>> get loadFailureOrSuccessOption;
  @override
  Option<Either<NetworkFailure, Unit>> get submitFailedOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_SchoolDepartmentStateCopyWith<_$_SchoolDepartmentState> get copyWith =>
      throw _privateConstructorUsedError;
}
