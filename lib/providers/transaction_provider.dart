import 'package:ecash/constants/enums.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:ecash/pages/sucess_transaction_page.dart';
import 'package:ecash/repository/transaction_repository.dart';
import 'package:ecash/utils/navigaton_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toast/toast.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> _transaction = <TransactionModel>[];
  bool _isLoading = false;
  List<TransactionModel> get listOfTransaction => _transaction;
  bool get isLoading => _isLoading;

  final _transactionRepository = TransactionRepository();

  Future<void> getTransactions() async {
    _isLoading = true;
    notifyListeners();
    try {
      final updatedList = await _transactionRepository.getTransactions();
      if (updatedList.isNotEmpty) {
        _isLoading = false;
        _transaction = updatedList;
        notifyListeners();
      }
    } catch (e) {}
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTransaction({TransactionModel transaction, BuildContext context, double currentUserWallet, TransactionType type}) async {
    _isLoading = true;
    notifyListeners();
    bool result = false;
    switch (type) {
      case TransactionType.income:
        result = await _transactionRepository.addWallet(transaction, currentUserWallet);
        break;
      case TransactionType.expense:
        result = await _transactionRepository.subtractWallet(transaction, currentUserWallet);
        break;
      default:
    }
    if (result) {
      _isLoading = false;
      notifyListeners();
      NavigationService().replaceScreen(
        page: SuccessTransactionPage(),
        type: PageTransitionType.rightToLeft,
      );
    } else {
      _isLoading = false;
      notifyListeners();
      Toast.show('Something went wrong \n Please Check Internet Connection', context, duration: 3, gravity: Toast.TOP);
    }
  }
}
