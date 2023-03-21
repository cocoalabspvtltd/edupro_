// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInEventCopyWith<$Res> {
  factory $LogInEventCopyWith(
          LogInEvent value, $Res Function(LogInEvent) then) =
      _$LogInEventCopyWithImpl<$Res, LogInEvent>;
}

/// @nodoc
class _$LogInEventCopyWithImpl<$Res, $Val extends LogInEvent>
    implements $LogInEventCopyWith<$Res> {
  _$LogInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmailChangedCopyWith<$Res> {
  factory _$$EmailChangedCopyWith(
          _$EmailChanged value, $Res Function(_$EmailChanged) then) =
      __$$EmailChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String emailStr});
}

/// @nodoc
class __$$EmailChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$EmailChanged>
    implements _$$EmailChangedCopyWith<$Res> {
  __$$EmailChangedCopyWithImpl(
      _$EmailChanged _value, $Res Function(_$EmailChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailStr = null,
  }) {
    return _then(_$EmailChanged(
      null == emailStr
          ? _value.emailStr
          : emailStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.emailStr);

  @override
  final String emailStr;

  @override
  String toString() {
    return 'LogInEvent.emailChanged(emailStr: $emailStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChanged &&
            (identical(other.emailStr, emailStr) ||
                other.emailStr == emailStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangedCopyWith<_$EmailChanged> get copyWith =>
      __$$EmailChangedCopyWithImpl<_$EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return emailChanged(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return emailChanged?.call(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(emailStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements LogInEvent {
  const factory EmailChanged(final String emailStr) = _$EmailChanged;

  String get emailStr;
  @JsonKey(ignore: true)
  _$$EmailChangedCopyWith<_$EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedCopyWith<$Res> {
  factory _$$PasswordChangedCopyWith(
          _$PasswordChanged value, $Res Function(_$PasswordChanged) then) =
      __$$PasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String passwordStr});
}

/// @nodoc
class __$$PasswordChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$PasswordChanged>
    implements _$$PasswordChangedCopyWith<$Res> {
  __$$PasswordChangedCopyWithImpl(
      _$PasswordChanged _value, $Res Function(_$PasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordStr = null,
  }) {
    return _then(_$PasswordChanged(
      null == passwordStr
          ? _value.passwordStr
          : passwordStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.passwordStr);

  @override
  final String passwordStr;

  @override
  String toString() {
    return 'LogInEvent.passwordChanged(passwordStr: $passwordStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChanged &&
            (identical(other.passwordStr, passwordStr) ||
                other.passwordStr == passwordStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passwordStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedCopyWith<_$PasswordChanged> get copyWith =>
      __$$PasswordChangedCopyWithImpl<_$PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return passwordChanged?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(passwordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements LogInEvent {
  const factory PasswordChanged(final String passwordStr) = _$PasswordChanged;

  String get passwordStr;
  @JsonKey(ignore: true)
  _$$PasswordChangedCopyWith<_$PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterPressedCopyWith<$Res> {
  factory _$$RegisterPressedCopyWith(
          _$RegisterPressed value, $Res Function(_$RegisterPressed) then) =
      __$$RegisterPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterPressedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$RegisterPressed>
    implements _$$RegisterPressedCopyWith<$Res> {
  __$$RegisterPressedCopyWithImpl(
      _$RegisterPressed _value, $Res Function(_$RegisterPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterPressed implements RegisterPressed {
  const _$RegisterPressed();

  @override
  String toString() {
    return 'LogInEvent.registerPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return registerPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return registerPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (registerPressed != null) {
      return registerPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return registerPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return registerPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (registerPressed != null) {
      return registerPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterPressed implements LogInEvent {
  const factory RegisterPressed() = _$RegisterPressed;
}

/// @nodoc
abstract class _$$NameChangedCopyWith<$Res> {
  factory _$$NameChangedCopyWith(
          _$NameChanged value, $Res Function(_$NameChanged) then) =
      __$$NameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String nameStr});
}

/// @nodoc
class __$$NameChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$NameChanged>
    implements _$$NameChangedCopyWith<$Res> {
  __$$NameChangedCopyWithImpl(
      _$NameChanged _value, $Res Function(_$NameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameStr = null,
  }) {
    return _then(_$NameChanged(
      null == nameStr
          ? _value.nameStr
          : nameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameChanged implements NameChanged {
  const _$NameChanged(this.nameStr);

  @override
  final String nameStr;

  @override
  String toString() {
    return 'LogInEvent.nameChanged(nameStr: $nameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameChanged &&
            (identical(other.nameStr, nameStr) || other.nameStr == nameStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nameStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameChangedCopyWith<_$NameChanged> get copyWith =>
      __$$NameChangedCopyWithImpl<_$NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return nameChanged(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return nameChanged?.call(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
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
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class NameChanged implements LogInEvent {
  const factory NameChanged(final String nameStr) = _$NameChanged;

  String get nameStr;
  @JsonKey(ignore: true)
  _$$NameChangedCopyWith<_$NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmPasswordChangedCopyWith<$Res> {
  factory _$$ConfirmPasswordChangedCopyWith(_$ConfirmPasswordChanged value,
          $Res Function(_$ConfirmPasswordChanged) then) =
      __$$ConfirmPasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String conPasswordStr});
}

/// @nodoc
class __$$ConfirmPasswordChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$ConfirmPasswordChanged>
    implements _$$ConfirmPasswordChangedCopyWith<$Res> {
  __$$ConfirmPasswordChangedCopyWithImpl(_$ConfirmPasswordChanged _value,
      $Res Function(_$ConfirmPasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conPasswordStr = null,
  }) {
    return _then(_$ConfirmPasswordChanged(
      null == conPasswordStr
          ? _value.conPasswordStr
          : conPasswordStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmPasswordChanged implements ConfirmPasswordChanged {
  const _$ConfirmPasswordChanged(this.conPasswordStr);

  @override
  final String conPasswordStr;

  @override
  String toString() {
    return 'LogInEvent.confirmPasswordChanged(conPasswordStr: $conPasswordStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPasswordChanged &&
            (identical(other.conPasswordStr, conPasswordStr) ||
                other.conPasswordStr == conPasswordStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conPasswordStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmPasswordChangedCopyWith<_$ConfirmPasswordChanged> get copyWith =>
      __$$ConfirmPasswordChangedCopyWithImpl<_$ConfirmPasswordChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return confirmPasswordChanged(conPasswordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return confirmPasswordChanged?.call(conPasswordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (confirmPasswordChanged != null) {
      return confirmPasswordChanged(conPasswordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return confirmPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return confirmPasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (confirmPasswordChanged != null) {
      return confirmPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class ConfirmPasswordChanged implements LogInEvent {
  const factory ConfirmPasswordChanged(final String conPasswordStr) =
      _$ConfirmPasswordChanged;

  String get conPasswordStr;
  @JsonKey(ignore: true)
  _$$ConfirmPasswordChangedCopyWith<_$ConfirmPasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStatusChangedCopyWith<$Res> {
  factory _$$UserStatusChangedCopyWith(
          _$UserStatusChanged value, $Res Function(_$UserStatusChanged) then) =
      __$$UserStatusChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String userStatusStr});
}

/// @nodoc
class __$$UserStatusChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$UserStatusChanged>
    implements _$$UserStatusChangedCopyWith<$Res> {
  __$$UserStatusChangedCopyWithImpl(
      _$UserStatusChanged _value, $Res Function(_$UserStatusChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStatusStr = null,
  }) {
    return _then(_$UserStatusChanged(
      null == userStatusStr
          ? _value.userStatusStr
          : userStatusStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserStatusChanged implements UserStatusChanged {
  const _$UserStatusChanged(this.userStatusStr);

  @override
  final String userStatusStr;

  @override
  String toString() {
    return 'LogInEvent.userStatusChanged(userStatusStr: $userStatusStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatusChanged &&
            (identical(other.userStatusStr, userStatusStr) ||
                other.userStatusStr == userStatusStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userStatusStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatusChangedCopyWith<_$UserStatusChanged> get copyWith =>
      __$$UserStatusChangedCopyWithImpl<_$UserStatusChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return userStatusChanged(userStatusStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return userStatusChanged?.call(userStatusStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (userStatusChanged != null) {
      return userStatusChanged(userStatusStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return userStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return userStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (userStatusChanged != null) {
      return userStatusChanged(this);
    }
    return orElse();
  }
}

abstract class UserStatusChanged implements LogInEvent {
  const factory UserStatusChanged(final String userStatusStr) =
      _$UserStatusChanged;

  String get userStatusStr;
  @JsonKey(ignore: true)
  _$$UserStatusChangedCopyWith<_$UserStatusChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationCodeChangedCopyWith<$Res> {
  factory _$$VerificationCodeChangedCopyWith(_$VerificationCodeChanged value,
          $Res Function(_$VerificationCodeChanged) then) =
      __$$VerificationCodeChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({int verificationCode});
}

/// @nodoc
class __$$VerificationCodeChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$VerificationCodeChanged>
    implements _$$VerificationCodeChangedCopyWith<$Res> {
  __$$VerificationCodeChangedCopyWithImpl(_$VerificationCodeChanged _value,
      $Res Function(_$VerificationCodeChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationCode = null,
  }) {
    return _then(_$VerificationCodeChanged(
      null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VerificationCodeChanged implements VerificationCodeChanged {
  const _$VerificationCodeChanged(this.verificationCode);

  @override
  final int verificationCode;

  @override
  String toString() {
    return 'LogInEvent.verificationCodeChanged(verificationCode: $verificationCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationCodeChanged &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationCodeChangedCopyWith<_$VerificationCodeChanged> get copyWith =>
      __$$VerificationCodeChangedCopyWithImpl<_$VerificationCodeChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return verificationCodeChanged(verificationCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return verificationCodeChanged?.call(verificationCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (verificationCodeChanged != null) {
      return verificationCodeChanged(verificationCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return verificationCodeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return verificationCodeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (verificationCodeChanged != null) {
      return verificationCodeChanged(this);
    }
    return orElse();
  }
}

abstract class VerificationCodeChanged implements LogInEvent {
  const factory VerificationCodeChanged(final int verificationCode) =
      _$VerificationCodeChanged;

  int get verificationCode;
  @JsonKey(ignore: true)
  _$$VerificationCodeChangedCopyWith<_$VerificationCodeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterWithEmailAndPasswordPressedCopyWith<$Res> {
  factory _$$RegisterWithEmailAndPasswordPressedCopyWith(
          _$RegisterWithEmailAndPasswordPressed value,
          $Res Function(_$RegisterWithEmailAndPasswordPressed) then) =
      __$$RegisterWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res,
        _$RegisterWithEmailAndPasswordPressed>
    implements _$$RegisterWithEmailAndPasswordPressedCopyWith<$Res> {
  __$$RegisterWithEmailAndPasswordPressedCopyWithImpl(
      _$RegisterWithEmailAndPasswordPressed _value,
      $Res Function(_$RegisterWithEmailAndPasswordPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterWithEmailAndPasswordPressed
    implements RegisterWithEmailAndPasswordPressed {
  const _$RegisterWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'LogInEvent.registerWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return registerWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return registerWithEmailAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return registerWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return registerWithEmailAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterWithEmailAndPasswordPressed implements LogInEvent {
  const factory RegisterWithEmailAndPasswordPressed() =
      _$RegisterWithEmailAndPasswordPressed;
}

/// @nodoc
abstract class _$$SignInWithEmailAndPasswordPressedCopyWith<$Res> {
  factory _$$SignInWithEmailAndPasswordPressedCopyWith(
          _$SignInWithEmailAndPasswordPressed value,
          $Res Function(_$SignInWithEmailAndPasswordPressed) then) =
      __$$SignInWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$SignInWithEmailAndPasswordPressed>
    implements _$$SignInWithEmailAndPasswordPressedCopyWith<$Res> {
  __$$SignInWithEmailAndPasswordPressedCopyWithImpl(
      _$SignInWithEmailAndPasswordPressed _value,
      $Res Function(_$SignInWithEmailAndPasswordPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInWithEmailAndPasswordPressed
    implements SignInWithEmailAndPasswordPressed {
  const _$SignInWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'LogInEvent.signInWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return signInWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return signInWithEmailAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return signInWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return signInWithEmailAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithEmailAndPasswordPressed implements LogInEvent {
  const factory SignInWithEmailAndPasswordPressed() =
      _$SignInWithEmailAndPasswordPressed;
}

/// @nodoc
abstract class _$$VerifyEduproUserCopyWith<$Res> {
  factory _$$VerifyEduproUserCopyWith(
          _$VerifyEduproUser value, $Res Function(_$VerifyEduproUser) then) =
      __$$VerifyEduproUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyEduproUserCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res, _$VerifyEduproUser>
    implements _$$VerifyEduproUserCopyWith<$Res> {
  __$$VerifyEduproUserCopyWithImpl(
      _$VerifyEduproUser _value, $Res Function(_$VerifyEduproUser) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifyEduproUser implements VerifyEduproUser {
  const _$VerifyEduproUser();

  @override
  String toString() {
    return 'LogInEvent.verifyEduproUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyEduproUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerPressed,
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String conPasswordStr) confirmPasswordChanged,
    required TResult Function(String userStatusStr) userStatusChanged,
    required TResult Function(int verificationCode) verificationCodeChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() verifyEduproUser,
  }) {
    return verifyEduproUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailChanged,
    TResult? Function(String passwordStr)? passwordChanged,
    TResult? Function()? registerPressed,
    TResult? Function(String nameStr)? nameChanged,
    TResult? Function(String conPasswordStr)? confirmPasswordChanged,
    TResult? Function(String userStatusStr)? userStatusChanged,
    TResult? Function(int verificationCode)? verificationCodeChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? verifyEduproUser,
  }) {
    return verifyEduproUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerPressed,
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String conPasswordStr)? confirmPasswordChanged,
    TResult Function(String userStatusStr)? userStatusChanged,
    TResult Function(int verificationCode)? verificationCodeChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (verifyEduproUser != null) {
      return verifyEduproUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserStatusChanged value) userStatusChanged,
    required TResult Function(VerificationCodeChanged value)
        verificationCodeChanged,
    required TResult Function(RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(VerifyEduproUser value) verifyEduproUser,
  }) {
    return verifyEduproUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserStatusChanged value)? userStatusChanged,
    TResult? Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult? Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(VerifyEduproUser value)? verifyEduproUser,
  }) {
    return verifyEduproUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserStatusChanged value)? userStatusChanged,
    TResult Function(VerificationCodeChanged value)? verificationCodeChanged,
    TResult Function(RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(VerifyEduproUser value)? verifyEduproUser,
    required TResult orElse(),
  }) {
    if (verifyEduproUser != null) {
      return verifyEduproUser(this);
    }
    return orElse();
  }
}

abstract class VerifyEduproUser implements LogInEvent {
  const factory VerifyEduproUser() = _$VerifyEduproUser;
}

/// @nodoc
mixin _$LogInState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  String get userStatus => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, UserLogInResponse>>
      get authFailureOrSuccessOption => throw _privateConstructorUsedError;
  int? get verificationCode => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get verifyFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogInStateCopyWith<LogInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInStateCopyWith<$Res> {
  factory $LogInStateCopyWith(
          LogInState value, $Res Function(LogInState) then) =
      _$LogInStateCopyWithImpl<$Res, LogInState>;
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      Name name,
      Password confirmPassword,
      String userStatus,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, UserLogInResponse>> authFailureOrSuccessOption,
      int? verificationCode,
      Option<Either<AuthFailure, Unit>> verifyFailureOrSuccessOption});
}

/// @nodoc
class _$LogInStateCopyWithImpl<$Res, $Val extends LogInState>
    implements $LogInStateCopyWith<$Res> {
  _$LogInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? name = null,
    Object? confirmPassword = null,
    Object? userStatus = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
    Object? verificationCode = freezed,
    Object? verifyFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, UserLogInResponse>>,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as int?,
      verifyFailureOrSuccessOption: null == verifyFailureOrSuccessOption
          ? _value.verifyFailureOrSuccessOption
          : verifyFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LogInStateCopyWith<$Res>
    implements $LogInStateCopyWith<$Res> {
  factory _$$_LogInStateCopyWith(
          _$_LogInState value, $Res Function(_$_LogInState) then) =
      __$$_LogInStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      Name name,
      Password confirmPassword,
      String userStatus,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, UserLogInResponse>> authFailureOrSuccessOption,
      int? verificationCode,
      Option<Either<AuthFailure, Unit>> verifyFailureOrSuccessOption});
}

/// @nodoc
class __$$_LogInStateCopyWithImpl<$Res>
    extends _$LogInStateCopyWithImpl<$Res, _$_LogInState>
    implements _$$_LogInStateCopyWith<$Res> {
  __$$_LogInStateCopyWithImpl(
      _$_LogInState _value, $Res Function(_$_LogInState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? name = null,
    Object? confirmPassword = null,
    Object? userStatus = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
    Object? verificationCode = freezed,
    Object? verifyFailureOrSuccessOption = null,
  }) {
    return _then(_$_LogInState(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, UserLogInResponse>>,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as int?,
      verifyFailureOrSuccessOption: null == verifyFailureOrSuccessOption
          ? _value.verifyFailureOrSuccessOption
          : verifyFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_LogInState implements _LogInState {
  const _$_LogInState(
      {required this.emailAddress,
      required this.password,
      required this.name,
      required this.confirmPassword,
      required this.userStatus,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption,
      required this.verificationCode,
      required this.verifyFailureOrSuccessOption});

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final Name name;
  @override
  final Password confirmPassword;
  @override
  final String userStatus;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, UserLogInResponse>>
      authFailureOrSuccessOption;
  @override
  final int? verificationCode;
  @override
  final Option<Either<AuthFailure, Unit>> verifyFailureOrSuccessOption;

  @override
  String toString() {
    return 'LogInState(emailAddress: $emailAddress, password: $password, name: $name, confirmPassword: $confirmPassword, userStatus: $userStatus, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption, verificationCode: $verificationCode, verifyFailureOrSuccessOption: $verifyFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogInState &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.verifyFailureOrSuccessOption,
                    verifyFailureOrSuccessOption) ||
                other.verifyFailureOrSuccessOption ==
                    verifyFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailAddress,
      password,
      name,
      confirmPassword,
      userStatus,
      showErrorMessages,
      isSubmitting,
      authFailureOrSuccessOption,
      verificationCode,
      verifyFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogInStateCopyWith<_$_LogInState> get copyWith =>
      __$$_LogInStateCopyWithImpl<_$_LogInState>(this, _$identity);
}

abstract class _LogInState implements LogInState {
  const factory _LogInState(
      {required final EmailAddress emailAddress,
      required final Password password,
      required final Name name,
      required final Password confirmPassword,
      required final String userStatus,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, UserLogInResponse>>
          authFailureOrSuccessOption,
      required final int? verificationCode,
      required final Option<Either<AuthFailure, Unit>>
          verifyFailureOrSuccessOption}) = _$_LogInState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  Name get name;
  @override
  Password get confirmPassword;
  @override
  String get userStatus;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, UserLogInResponse>> get authFailureOrSuccessOption;
  @override
  int? get verificationCode;
  @override
  Option<Either<AuthFailure, Unit>> get verifyFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_LogInStateCopyWith<_$_LogInState> get copyWith =>
      throw _privateConstructorUsedError;
}
