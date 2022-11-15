import 'package:ecash/controllers/authentication_controller.dart';
import 'package:ecash/controllers/transaction_controller.dart';
import 'package:ecash/controllers/transaction_state.dart';
import 'package:ecash/controllers/user_state.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthenticationController, UserState>((ref) 
        => AuthenticationController(UserState()));

final transactionProvider = StateNotifierProvider.autoDispose<TransactionController, TransactionState>(
  (ref){
    return TransactionController(
      const TransactionState(
        AsyncValue.data(<TransactionModel>[])
      )
    );
  }
);