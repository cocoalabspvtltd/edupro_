// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_department_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditDepartmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function() saveAndUpdatePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function()? saveAndUpdatePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function()? saveAndUpdatePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SaveAndUpdatePressed value) saveAndUpdatePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SaveAndUpdatePressed value)? saveAndUpdatePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SaveAndUpdatePressed value)? saveAndUpdatePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditDepartmentEventCopyWith<$Res> {
  factory $EditDepartmentEventCopyWith(
          EditDepartmentEvent value, $Res Function(EditDepartmentEvent) then) =
      _$EditDepartmentEventCopyWithImpl<$Res, EditDepartmentEvent>;
}

/// @nodoc
class _$EditDepartmentEventCopyWithImpl<$Res, $Val extends EditDepartmentEvent>
    implements $EditDepartmentEventCopyWith<$Res> {
  _$EditDepartmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$EditDepartmentEventCopyWithImpl<$Res, _$_NameChanged>
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
    return 'EditDepartmentEvent.nameChanged(nameStr: $nameStr)';
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
    required TResult Function(String nameStr) nameChanged,
    required TResult Function() saveAndUpdatePressed,
  }) {
    return nameChanged(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function()? saveAndUpdatePressed,
  }) {
    return nameChanged?.call(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function()? saveAndUpdatePressed,
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
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SaveAndUpdatePressed value) saveAndUpdatePressed,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SaveAndUpdatePressed value)? saveAndUpdatePressed,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SaveAndUpdatePressed value)? saveAndUpdatePressed,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements EditDepartmentEvent {
  const factory _NameChanged(final String nameStr) = _$_NameChanged;

  String get nameStr;
  @JsonKey(ignore: true)
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SaveAndUpdatePressedCopyWith<$Res> {
  factory _$$_SaveAndUpdatePressedCopyWith(_$_SaveAndUpdatePressed value,
          $Res Function(_$_SaveAndUpdatePressed) then) =
      __$$_SaveAndUpdatePressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SaveAndUpdatePressedCopyWithImpl<$Res>
    extends _$EditDepartmentEventCopyWithImpl<$Res, _$_SaveAndUpdatePressed>
    implements _$$_SaveAndUpdatePressedCopyWith<$Res> {
  __$$_SaveAndUpdatePressedCopyWithImpl(_$_SaveAndUpdatePressed _value,
      $Res Function(_$_SaveAndUpdatePressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SaveAndUpdatePressed implements _SaveAndUpdatePressed {
  const _$_SaveAndUpdatePressed();

  @override
  String toString() {
    return 'EditDepartmentEvent.saveAndUpdatePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SaveAndUpdatePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function() saveAndUpdatePressed,
  }) {
    return saveAndUpdatePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function()? saveAndUpdatePressed,
  }) {
    return saveAndUpdatePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function()? saveAndUpdatePressed,
    required TResult orElse(),
  }) {
    if (saveAndUpdatePressed != null) {
      return saveAndUpdatePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SaveAndUpdatePressed value) saveAndUpdatePressed,
  }) {
    return saveAndUpdatePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SaveAndUpdatePressed value)? saveAndUpdatePressed,
  }) {
    return saveAndUpdatePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SaveAndUpdatePressed value)? saveAndUpdatePressed,
    required TResult orElse(),
  }) {
    if (saveAndUpdatePressed != null) {
      return saveAndUpdatePressed(this);
    }
    return orElse();
  }
}

abstract class _SaveAndUpdatePressed implements EditDepartmentEvent {
  const factory _SaveAndUpdatePressed() = _$_SaveAndUpdatePressed;
}

/// @nodoc
mixin _$EditDepartmentState {
  Name get name => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  TextEditingController get nameController =>
      throw _privateConstructorUsedError;
  Option<Either<NetworkFailure, AddDepartmentResponse>>
      get loadFailureOrSuccessOption => throw _privateConstructorUsedError;
  Option<Either<NetworkFailure, AddDepartmentResponse>>
      get submitFailedOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditDepartmentStateCopyWith<EditDepartmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditDepartmentStateCopyWith<$Res> {
  factory $EditDepartmentStateCopyWith(
          EditDepartmentState value, $Res Function(EditDepartmentState) then) =
      _$EditDepartmentStateCopyWithImpl<$Res, EditDepartmentState>;
  @useResult
  $Res call(
      {Name name,
      bool showErrorMessages,
      bool isLoading,
      bool isSubmitting,
      TextEditingController nameController,
      Option<Either<NetworkFailure, AddDepartmentResponse>>
          loadFailureOrSuccessOption,
      Option<Either<NetworkFailure, AddDepartmentResponse>>
          submitFailedOrSuccessOption});
}

/// @nodoc
class _$EditDepartmentStateCopyWithImpl<$Res, $Val extends EditDepartmentState>
    implements $EditDepartmentStateCopyWith<$Res> {
  _$EditDepartmentStateCopyWithImpl(this._value, this._then);

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
    Object? nameController = null,
    Object? loadFailureOrSuccessOption = null,
    Object? submitFailedOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
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
      nameController: null == nameController
          ? _value.nameController
          : nameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, AddDepartmentResponse>>,
      submitFailedOrSuccessOption: null == submitFailedOrSuccessOption
          ? _value.submitFailedOrSuccessOption
          : submitFailedOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, AddDepartmentResponse>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditDepartmentStateCopyWith<$Res>
    implements $EditDepartmentStateCopyWith<$Res> {
  factory _$$_EditDepartmentStateCopyWith(_$_EditDepartmentState value,
          $Res Function(_$_EditDepartmentState) then) =
      __$$_EditDepartmentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Name name,
      bool showErrorMessages,
      bool isLoading,
      bool isSubmitting,
      TextEditingController nameController,
      Option<Either<NetworkFailure, AddDepartmentResponse>>
          loadFailureOrSuccessOption,
      Option<Either<NetworkFailure, AddDepartmentResponse>>
          submitFailedOrSuccessOption});
}

/// @nodoc
class __$$_EditDepartmentStateCopyWithImpl<$Res>
    extends _$EditDepartmentStateCopyWithImpl<$Res, _$_EditDepartmentState>
    implements _$$_EditDepartmentStateCopyWith<$Res> {
  __$$_EditDepartmentStateCopyWithImpl(_$_EditDepartmentState _value,
      $Res Function(_$_EditDepartmentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? showErrorMessages = null,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? nameController = null,
    Object? loadFailureOrSuccessOption = null,
    Object? submitFailedOrSuccessOption = null,
  }) {
    return _then(_$_EditDepartmentState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
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
      nameController: null == nameController
          ? _value.nameController
          : nameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      loadFailureOrSuccessOption: null == loadFailureOrSuccessOption
          ? _value.loadFailureOrSuccessOption
          : loadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, AddDepartmentResponse>>,
      submitFailedOrSuccessOption: null == submitFailedOrSuccessOption
          ? _value.submitFailedOrSuccessOption
          : submitFailedOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NetworkFailure, AddDepartmentResponse>>,
    ));
  }
}

/// @nodoc

class _$_EditDepartmentState implements _EditDepartmentState {
  const _$_EditDepartmentState(
      {required this.name,
      required this.showErrorMessages,
      required this.isLoading,
      required this.isSubmitting,
      required this.nameController,
      required this.loadFailureOrSuccessOption,
      required this.submitFailedOrSuccessOption});

  @override
  final Name name;
  @override
  final bool showErrorMessages;
  @override
  final bool isLoading;
  @override
  final bool isSubmitting;
  @override
  final TextEditingController nameController;
  @override
  final Option<Either<NetworkFailure, AddDepartmentResponse>>
      loadFailureOrSuccessOption;
  @override
  final Option<Either<NetworkFailure, AddDepartmentResponse>>
      submitFailedOrSuccessOption;

  @override
  String toString() {
    return 'EditDepartmentState(name: $name, showErrorMessages: $showErrorMessages, isLoading: $isLoading, isSubmitting: $isSubmitting, nameController: $nameController, loadFailureOrSuccessOption: $loadFailureOrSuccessOption, submitFailedOrSuccessOption: $submitFailedOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditDepartmentState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.nameController, nameController) ||
                other.nameController == nameController) &&
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
      nameController,
      loadFailureOrSuccessOption,
      submitFailedOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditDepartmentStateCopyWith<_$_EditDepartmentState> get copyWith =>
      __$$_EditDepartmentStateCopyWithImpl<_$_EditDepartmentState>(
          this, _$identity);
}

abstract class _EditDepartmentState implements EditDepartmentState {
  const factory _EditDepartmentState(
      {required final Name name,
      required final bool showErrorMessages,
      required final bool isLoading,
      required final bool isSubmitting,
      required final TextEditingController nameController,
      required final Option<Either<NetworkFailure, AddDepartmentResponse>>
          loadFailureOrSuccessOption,
      required final Option<Either<NetworkFailure, AddDepartmentResponse>>
          submitFailedOrSuccessOption}) = _$_EditDepartmentState;

  @override
  Name get name;
  @override
  bool get showErrorMessages;
  @override
  bool get isLoading;
  @override
  bool get isSubmitting;
  @override
  TextEditingController get nameController;
  @override
  Option<Either<NetworkFailure, AddDepartmentResponse>>
      get loadFailureOrSuccessOption;
  @override
  Option<Either<NetworkFailure, AddDepartmentResponse>>
      get submitFailedOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_EditDepartmentStateCopyWith<_$_EditDepartmentState> get copyWith =>
      throw _privateConstructorUsedError;
}
