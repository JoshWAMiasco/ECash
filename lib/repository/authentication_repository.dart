import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/test_account_model.dart';
import 'package:ecash/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final currentUser = FirebaseAuth.instance.currentUser;
  Future<UserModel> getUser() async {
    if (currentUser == null) {
      // no currently login
      return null;
    }

    UserModel user;
    try {
      await FirebaseFirestore.instance.collection("Users").doc(currentUser.uid).get().then((query) {
        if (query.data() != null) {
          user = UserModel.fromJson(id: query.id, json: query.data());
        }
      });
    } catch (e) {}
    return user;
  }

  Stream<UserModel> startListener() {
    return FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).snapshots().map((query) {
      return UserModel.fromJson(id: query.id, json: query.data());
    });
  }

  Future<UserModel> loginUser({String mobile}) async {
    UserModel user;
    final userDoc = await FirebaseFirestore.instance.collection('Users').where('mobile', isEqualTo: mobile).get();
    if (userDoc.docs.isNotEmpty) {
      UserModel newUser = UserModel.fromJson(id: userDoc.docs.first.id, json: userDoc.docs.first.data());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: newUser.email, password: newUser.password);
        user = newUser;
      } catch (e) {}
    }
    return user;
  }

  Future<bool> logoutUser() async {
    bool result = false;
    try {
      await FirebaseAuth.instance.signOut();
      result = true;
    } catch (e) {}
    return result;
  }

  Future<bool> updateUserData(UserModel newUserData) async {
    bool result = false;
    try {
      await FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).update(newUserData.toJson());
      result = true;
    } catch (e) {}
    return result;
  }

  Future<String> getFakeOTP() async {
    String result = "";
    var random = Random();
    await FirebaseFirestore.instance.collection('AppData').doc('FakeOTP').get().then((value) {
      if (value != null) {
        List<String> fakeOtp = List.from(value['listOfOtp']);
        result = fakeOtp[random.nextInt(9)];
      }
    });
    return result;
  }
}
