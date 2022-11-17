// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get userName => throw _privateConstructorUsedError;
  int? get beansPoint => throw _privateConstructorUsedError;
  String? get realName => throw _privateConstructorUsedError;
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;
  String? get authKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? userName,
      int? beansPoint,
      String? realName,
      DateTime? dateCreated,
      String? password,
      String? qrCode,
      String? authKey});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? beansPoint = freezed,
    Object? realName = freezed,
    Object? dateCreated = freezed,
    Object? password = freezed,
    Object? qrCode = freezed,
    Object? authKey = freezed,
  }) {
    return _then(_value.copyWith(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      beansPoint: freezed == beansPoint
          ? _value.beansPoint
          : beansPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      realName: freezed == realName
          ? _value.realName
          : realName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      authKey: freezed == authKey
          ? _value.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userName,
      int? beansPoint,
      String? realName,
      DateTime? dateCreated,
      String? password,
      String? qrCode,
      String? authKey});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? beansPoint = freezed,
    Object? realName = freezed,
    Object? dateCreated = freezed,
    Object? password = freezed,
    Object? qrCode = freezed,
    Object? authKey = freezed,
  }) {
    return _then(_$_UserModel(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      beansPoint: freezed == beansPoint
          ? _value.beansPoint
          : beansPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      realName: freezed == realName
          ? _value.realName
          : realName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      authKey: freezed == authKey
          ? _value.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {this.userName,
      this.beansPoint,
      this.realName,
      this.dateCreated,
      this.password,
      this.qrCode,
      this.authKey});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String? userName;
  @override
  final int? beansPoint;
  @override
  final String? realName;
  @override
  final DateTime? dateCreated;
  @override
  final String? password;
  @override
  final String? qrCode;
  @override
  final String? authKey;

  @override
  String toString() {
    return 'UserModel(userName: $userName, beansPoint: $beansPoint, realName: $realName, dateCreated: $dateCreated, password: $password, qrCode: $qrCode, authKey: $authKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.beansPoint, beansPoint) ||
                other.beansPoint == beansPoint) &&
            (identical(other.realName, realName) ||
                other.realName == realName) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.authKey, authKey) || other.authKey == authKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, beansPoint, realName,
      dateCreated, password, qrCode, authKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {final String? userName,
      final int? beansPoint,
      final String? realName,
      final DateTime? dateCreated,
      final String? password,
      final String? qrCode,
      final String? authKey}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String? get userName;
  @override
  int? get beansPoint;
  @override
  String? get realName;
  @override
  DateTime? get dateCreated;
  @override
  String? get password;
  @override
  String? get qrCode;
  @override
  String? get authKey;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
