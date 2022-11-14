
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:ecash/models/user_model.dart';
import 'package:ecash/repository/transaction_responce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TransactionRepository {

  final transactionCollection = FirebaseFirestore.instance.collection('Users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection('Transactions');
  final userCollection = FirebaseFirestore.instance.collection('Users');

  Future<TransactionResponce> getTransactionsList() async {
    try {
      List<TransactionModel> transactions = <TransactionModel>[];
      await transactionCollection.orderBy('date', descending: false).get().then((query){
        if(query.docs.isNotEmpty){
          for(var doc in query.docs){
            transactions.add(TransactionModel.fromJson(doc.data()));
          }
        } else {
          return TransactionResponce(
            failure: false,
            message: 'empty',
          );
        }
      });
      return TransactionResponce(
        failure: false,
        transactions: transactions,
      );
    } on FirebaseException catch (e) {
      return TransactionResponce(
        failure: true,
        message: e.message!,
      );
    }
  }

  Future<bool> cashInViaSevenEleven(double amount, UserModel user)async{
    var updatedUserData = user;
    updatedUserData = updatedUserData.copyWith(
      walletBalance: updatedUserData.walletBalance! + amount,
    );
    TransactionModel newTransaction = TransactionModel(
      amount: amount,
      date: DateTime.now(),
      description: 'Cash in via Seven Eleven',
      title: 'Cash In',
      type: TransactionType.income,
    );
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    try {
      await transactionCollection.doc().set(newTransaction.toJson());
      await userCollection.doc(userUid).update(updatedUserData.toJson());
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

}