import 'package:ecash/models/user_model.dart';

class UserResponce {
  bool failure;
  UserModel? user;
  String uid;
  String message;

  UserResponce({
    this.failure = true,
    this.uid = '',
    this.user,
    this.message = '',
  });
}