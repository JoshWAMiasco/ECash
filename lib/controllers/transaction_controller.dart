import 'package:ecash/controllers/transaction_state.dart';
import 'package:ecash/models/user_model.dart';
import 'package:ecash/repository/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionController extends StateNotifier<TransactionState> {
  TransactionController(super.state);
  final _transactionRepository = TransactionRepository();
  Future<void> getUserTransactionsHistory()async {
    state = state.copyWith(transactions: const  AsyncValue.loading());
    final res = await _transactionRepository.getTransactionsList();
    if (res.failure == false){
      state = state.copyWith(transactions: AsyncValue.data(res.transactions!));
    } else {
      state = state.copyWith(transactions: AsyncValue.error(res, StackTrace.current));
    }
  }

  Future<bool> cashInViaSevenEleven(double amount, UserModel user) async {
    final isSuccess = await _transactionRepository.cashInViaSevenEleven(amount, user);
    if(isSuccess){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> paybill(double amount, UserModel user, String merchant) async {
    final isSuccess = await _transactionRepository.payBill(amount, user, merchant);
    if(isSuccess){
      return true;
    } else {
      return false;
    }
  }
}