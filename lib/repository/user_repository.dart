
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/user_model.dart';
import 'package:ecash/repository/user_responce.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositpory {

  final userCollection = FirebaseFirestore.instance.collection('Users');
  final currentUser = FirebaseAuth.instance.currentUser;
  
  Future<UserResponce> login(String mobileNumber, String mpin) async {
    String email = "$mobileNumber@ecash.com";
    String password = "ecash-$mpin";
    try {
       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
       if (userCredential.user != null) {
          final userDoc = await userCollection.doc(userCredential.user!.uid).get();
          if(userDoc.data() != null){
            return UserResponce(
              failure: false,
              user: UserModel.fromJson(userDoc.data()!)
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
    if(currentUser != null) {
      final userDoc = await userCollection.doc(currentUser!.uid).get();
      if(userDoc.data() != null){
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
      return UserResponce(
        failure: true,
        message: e.message ?? ''
      );
    }
  } 

  Stream<UserResponce> addListner() {
    return userCollection.doc(currentUser!.uid).snapshots().map((query) {
      if(query.data() != null) {
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
}