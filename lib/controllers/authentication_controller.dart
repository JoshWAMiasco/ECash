import 'dart:async';
import 'package:ecash/models/user_model.dart';
import 'package:ecash/repository/user_repository.dart';
import 'package:ecash/repository/user_responce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationController extends ChangeNotifier {
  UserModel? user;
  final _userRepository = UserRepositpory();

  StreamSubscription? _streamSubscription;

  Future<UserResponce> login(String mobileNumber, String mpin) async {
    final res = await _userRepository.login(mobileNumber, mpin);
    if (res.failure == false) {
      user = res.user;
      notifyListeners();
    }
    return res;
  }

  Future<UserResponce> logout() async {
    return await _userRepository.logout().then((res) {
      if (res.failure == false) {
        user = null;
        _streamSubscription?.cancel();
        notifyListeners();
        return UserResponce(
          failure: false,
        );
      } else {
        return UserResponce(failure: true, message: 'Went something wrong');
      }
    });
  }

  Future<UserResponce> checkIsLogin() async {
    final res = await _userRepository.checkIsLogin();
    if (res.failure == false) {
      user = res.user;
      listenToUserData();
      notifyListeners();
    }
    return res;
  }

  void listenToUserData() {
    _streamSubscription = _userRepository.addListner().listen((res) {
      if (res.failure == false) {
        user = res.user;
        notifyListeners();
      }
    });
  }

  Future<UserResponce> register(UserModel user) async {
    final res = await _userRepository.registerUser(user);
    if (res.failure == false) {
      user = res.user!;
    }
    return res;
  }

  String getUserId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }
}
