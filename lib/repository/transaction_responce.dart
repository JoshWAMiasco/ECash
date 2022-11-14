import 'package:ecash/models/transaction_model.dart';

class TransactionResponce {
  bool failure;
  List<TransactionModel>? transactions;
  String message;

  TransactionResponce({
    this.failure = true,
    this.transactions,
    this.message = '',
  });
}