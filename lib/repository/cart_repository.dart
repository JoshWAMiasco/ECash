import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/cart_item_model.dart';
import 'package:ecash/repository/cart_responce.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepository {
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<CartResponce> getMyCartItems() async {
    try {
      final query = await FirebaseFirestore.instance.collection('Users').doc(currentUser!.uid).collection('Cart').orderBy('dateAdded', descending: true).get();
      if (query.docs.isNotEmpty) {
        List<CartItemModel> items = <CartItemModel>[];
        for (var doc in query.docs) {
          items.add(CartItemModel.fromJson(doc.id, doc.data()));
        }
        return CartResponce(
          failure: false,
          lisOfItem: items,
        );
      } else {
        return CartResponce(
          failure: true,
          message: 'empty',
        );
      }
    } on FirebaseException catch (e) {
      return CartResponce(
        failure: true,
        message: e.message!,
      );
    }
  }

  Future<CartResponce> addToCart(CartItemModel cartItem) async {
    try {
      cartItem.isChecked = true;
      await FirebaseFirestore.instance.collection('Users').doc(currentUser?.uid).collection('Cart').add(cartItem.toJson());
      return CartResponce(
        failure: false,
        message: 'Success!',
      );
    } on FirebaseException catch (e) {
      return CartResponce(
        failure: true,
        message: e.message!,
      );
    }
  }

  Future<CartResponce> update(CartItemModel cartItem, {String? message}) async {
     try {
      await FirebaseFirestore.instance.collection('Users').doc(currentUser?.uid).collection('Cart').doc(cartItem.id).update(cartItem.toJson());
      return CartResponce(
        failure: false,
        message: message ?? 'Success!',
      );
    } on FirebaseException catch (e) {
      return CartResponce(
        failure: true,
        message: e.message!,
      );
    }
  }

}
