import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionRepository {
  final currentUser = FirebaseAuth.instance.currentUser;
  Future<List<TransactionModel>> getTransactions() async {
    List<TransactionModel> result = <TransactionModel>[];
    try {
      await FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).collection('Transactions').get().then((query) {
        if (query.docs.isNotEmpty) {
          for (var doc in query.docs) {
            result.add(TransactionModel.fromJson(doc.data()));
          }
        }
      });
    } catch (e) {}
    return result;
  }

  Future<bool> addWallet(TransactionModel transaction, double currentUserWallet) async {
    bool result = false;
    final batch = FirebaseFirestore.instance.batch();
    batch.update(FirebaseFirestore.instance.collection('Users').doc(currentUser.uid), {
      "wallet": currentUserWallet + transaction.amount,
    });
    batch.set(FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).collection('Transactions').doc(), transaction.toJson());
    try {
      await batch.commit();
      result = true;
    } catch (e) {}
    return result;
  }

  Future<bool> subtractWallet(TransactionModel transaction, double currentUserWallet) async {
    bool result = false;
    final batch = FirebaseFirestore.instance.batch();
    batch.update(FirebaseFirestore.instance.collection('Users').doc(currentUser.uid), {
      "wallet": currentUserWallet - transaction.amount,
    });
    batch.set(FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).collection('Transactions').doc(), transaction.toJson());
    try {
      await batch.commit();
      result = true;
    } catch (e) {}
    return result;
  }
}
