import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? userName,
    double? beansPoint,
    String? realName,
    DateTime? dateCreated,
    String? password,
    String? qrCode,
    String? authKey,
    String? mpin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
