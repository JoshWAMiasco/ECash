import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/constants/app_utils.dart';
import 'package:ecash/models/user_model.dart';
import 'package:ecash/repository/user_responce.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositpory {
  final userCollection = FirebaseFirestore.instance.collection('Users');
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<UserResponce> login(String username, String password) async {
    final email = '$username@brewed.com';
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        final userDoc = await userCollection.doc(userCredential.user!.uid).get();
        if (userDoc.data() != null) {
          return UserResponce(failure: false, user: UserModel.fromJson(userDoc.data()!));
        } else {
          return UserResponce(
            failure: true,
            message: 'User Data not found',
          );
        }
      } else {
        return UserResponce(
          failure: true,
          message: 'Mobile Number or Mpin is In correct.',
        );
      }
    } on FirebaseAuthException catch (e) {
      return UserResponce(
        failure: true,
        message: e.message!,
      );
    }
  }

  Future<UserResponce> checkIsLogin() async {
    if (currentUser != null) {
      final userDoc = await userCollection.doc(currentUser!.uid).get();
      if (userDoc.data() != null) {
        return UserResponce(
          failure: false,
          user: UserModel.fromJson(userDoc.data()!),
          uid: currentUser!.uid,
        );
      } else {
        return UserResponce(
          failure: true,
          message: 'User Data not found',
        );
      }
    } else {
      return UserResponce(
        failure: true,
      );
    }
  }

  Future<UserResponce> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return UserResponce(
        failure: false,
      );
    } on FirebaseAuthException catch (e) {
      return UserResponce(failure: true, message: e.message ?? '');
    }
  }

  Stream<UserResponce> addListner() {
    return userCollection.doc(currentUser!.uid).snapshots().map((query) {
      if (query.data() != null) {
        return UserResponce(
          failure: false,
          user: UserModel.fromJson(query.data()!),
          uid: currentUser!.uid,
        );
      } else {
        return UserResponce(
          failure: true,
        );
      }
    });
  }

  Future<UserResponce> registerUser(UserModel newUser) async {
    try {
      final userquery = await userCollection.where('username', isEqualTo: newUser.userName).get();
      if (userquery.docs.isEmpty) {
        final email = '${newUser.userName}@brewed.com';
        try {
          final userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: newUser.password!);
          final encryptedPassword = AppUtils.encryptPassword(newUser.password!);
          newUser = newUser.copyWith(password: encryptedPassword);
          try {
            await userCollection.doc(userCred.user!.uid).set(newUser.toJson());
            return UserResponce(
              failure: false,
              message: 'Success',
              uid: userCred.user!.uid,
              user: newUser,
            );
          } on FirebaseException catch (e) {
            return UserResponce(
              failure: true,
              message: e.message!,
            );
          }
        } on FirebaseAuthException catch (e) {
          return UserResponce(
            failure: true,
            message: e.message!,
          );
        }
      } else {
        return UserResponce(
          failure: true,
          message: 'Username is Already Taken!.',
        );
      }
    } on FirebaseAuthException catch (e) {
      return UserResponce(
        failure: true,
        message: e.message!,
      );
    }
  }
}
