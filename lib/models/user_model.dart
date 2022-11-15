import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? mobileNumber,
    double? walletBalance,
    String? firstname,
    String? lastname,
    String? mpin,
    String? profilePicture,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);
}