// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      userName: json['userName'] as String?,
      beansPoint: json['beansPoint'] as int?,
      realName: json['realName'] as String?,
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      password: json['password'] as String?,
      qrCode: json['qrCode'] as String?,
      authKey: json['authKey'] as String?,
      mpin: json['mpin'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'beansPoint': instance.beansPoint,
      'realName': instance.realName,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'password': instance.password,
      'qrCode': instance.qrCode,
      'authKey': instance.authKey,
      'mpin': instance.mpin,
    };
