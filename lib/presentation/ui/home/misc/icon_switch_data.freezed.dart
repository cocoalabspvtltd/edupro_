// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icon_switch_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IconSwitchData {
  bool get toggle => throw _privateConstructorUsedError;
  Icon get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IconSwitchDataCopyWith<IconSwitchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconSwitchDataCopyWith<$Res> {
  factory $IconSwitchDataCopyWith(
          IconSwitchData value, $Res Function(IconSwitchData) then) =
      _$IconSwitchDataCopyWithImpl<$Res, IconSwitchData>;
  @useResult
  $Res call({bool toggle, Icon icon});
}

/// @nodoc
class _$IconSwitchDataCopyWithImpl<$Res, $Val extends IconSwitchData>
    implements $IconSwitchDataCopyWith<$Res> {
  _$IconSwitchDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      toggle: null == toggle
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IconSwitchDataCopyWith<$Res>
    implements $IconSwitchDataCopyWith<$Res> {
  factory _$$_IconSwitchDataCopyWith(
          _$_IconSwitchData value, $Res Function(_$_IconSwitchData) then) =
      __$$_IconSwitchDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool toggle, Icon icon});
}

/// @nodoc
class __$$_IconSwitchDataCopyWithImpl<$Res>
    extends _$IconSwitchDataCopyWithImpl<$Res, _$_IconSwitchData>
    implements _$$_IconSwitchDataCopyWith<$Res> {
  __$$_IconSwitchDataCopyWithImpl(
      _$_IconSwitchData _value, $Res Function(_$_IconSwitchData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
    Object? icon = null,
  }) {
    return _then(_$_IconSwitchData(
      toggle: null == toggle
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ));
  }
}

/// @nodoc

class _$_IconSwitchData
    with DiagnosticableTreeMixin
    implements _IconSwitchData {
  const _$_IconSwitchData({required this.toggle, required this.icon});

  @override
  final bool toggle;
  @override
  final Icon icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IconSwitchData(toggle: $toggle, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IconSwitchData'))
      ..add(DiagnosticsProperty('toggle', toggle))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IconSwitchData &&
            (identical(other.toggle, toggle) || other.toggle == toggle) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toggle, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IconSwitchDataCopyWith<_$_IconSwitchData> get copyWith =>
      __$$_IconSwitchDataCopyWithImpl<_$_IconSwitchData>(this, _$identity);
}

abstract class _IconSwitchData implements IconSwitchData {
  const factory _IconSwitchData(
      {required final bool toggle,
      required final Icon icon}) = _$_IconSwitchData;

  @override
  bool get toggle;
  @override
  Icon get icon;
  @override
  @JsonKey(ignore: true)
  _$$_IconSwitchDataCopyWith<_$_IconSwitchData> get copyWith =>
      throw _privateConstructorUsedError;
}
