import 'dart:async';

import 'package:ecash/models/user_model.dart';
import 'package:ecash/pages/home_page.dart';
import 'package:ecash/pages/login_page.dart';
import 'package:ecash/pages/main_page.dart';
import 'package:ecash/pages/otp_page.dart';
import 'package:ecash/repository/authentication_repository.dart';
import 'package:ecash/utils/navigaton_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toast/toast.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user;
  bool _isLoading;
  String _otp;
  String get fakeOtp => _otp;
  UserModel get user => _user;
  bool get isLoading => _isLoading;
  final _authenticationRepository = AuthenticationRepository();
  StreamSubscription _streamSubscription;

  Future<bool> checkUser() async {
    bool result = false;
    _isLoading = true;
    notifyListeners();
    UserModel currentUser = await _authenticationRepository.getUser();
    if (currentUser != null) {
      _user = currentUser;
      result = true;
      _isLoading = false;
      notifyListeners();
      NavigationService().navigateToScreen(
        page: MainPage(),
        type: PageTransitionType.fade,
      );
    } else {
      _isLoading = false;
      notifyListeners();
      NavigationService().navigateToScreen(
        page: LoginPage(),
        type: PageTransitionType.fade,
      );
    }
    return result;
  }

  Future<void> logIn(String mobile, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    UserModel loginUser = await _authenticationRepository.loginUser(mobile: mobile);
    if (loginUser != null) {
      _user = loginUser;
      _isLoading = false;
      notifyListeners();
      NavigationService().navigateToScreen(
        page: OtpPage(),
        type: PageTransitionType.fade,
      );
      getOtp();
    } else {
      _isLoading = false;
      notifyListeners();
      Toast.show('Account Not Registered', context, duration: 3, gravity: Toast.TOP);
    }
  }

  Future<void> getOtp() async {
    _isLoading = true;
    notifyListeners();
    String result = await _authenticationRepository.getFakeOTP();
    if (result != "") {
      Future.delayed(Duration(seconds: 2), () {
        _otp = result;
        _isLoading = false;

        notifyListeners();
      });
    } else {
      _isLoading = false;
      notifyListeners();
    }
  }

  void startListener() {
    _streamSubscription = _authenticationRepository.startListener().listen((updatedUser) {
      _user = updatedUser;
      notifyListeners();
    });
  }

  Future<void> logOutUser() async {
    _isLoading = true;
    notifyListeners();
    bool success = await _authenticationRepository.logoutUser();
    if (success) {
      _isLoading = false;
      _user = null;
      _otp = "";
      _streamSubscription?.cancel();
      notifyListeners();
      NavigationService().popToFirst();
      Future.delayed(Duration(seconds: 4), () => checkUser());
      //Future.delayed(Duration(milliseconds: 1500), () => checkUser());
    } else {
      _isLoading = true;
      notifyListeners();
    }
  }
}
