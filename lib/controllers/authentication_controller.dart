
import 'dart:async';

import 'package:ecash/controllers/user_state.dart';
import 'package:ecash/models/user_model.dart';
import 'package:ecash/repository/user_repository.dart';
import 'package:ecash/repository/user_responce.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationController extends StateNotifier<UserState> {
  AuthenticationController(super.state);

  final _userRepository = UserRepositpory();
  StreamSubscription? _streamSubscription;
  
  UserModel? getUserData() {
    return state.user;
  }

  Future<UserResponce> login(String mobileNumber, String mpin) async {
    final res = await _userRepository.login(mobileNumber, mpin);
    if(res.failure == false){
      state.user = res.user;
    }
    return res;
  }

  Future<UserResponce> logout() async {
    return await _userRepository.logout().then((res){
      if(res.failure == false){
        state.user = null;
        return UserResponce(
          failure: false,
        );
      } else {
        return UserResponce(
          failure: true,
          message: 'Went something wrong'
        );
      }
    });
  }

  Future<UserResponce> checkIsLogin() async {
    final res = await _userRepository.checkIsLogin();
    if(res.failure == false){
      state.user = res.user;
    }
    return res;
  }

  void listenToUserData() {
    _streamSubscription = _userRepository.addListner().listen((res) {
      if(res.failure == false){
        state.user = res.user;
      }
    });
  }


}