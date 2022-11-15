// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      mobileNumber: json['mobileNumber'] as String?,
      walletBalance: (json['walletBalance'] as num?)?.toDouble(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      mpin: json['mpin'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'walletBalance': instance.walletBalance,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'mpin': instance.mpin,
      'profilePicture': instance.profilePicture,
    };
