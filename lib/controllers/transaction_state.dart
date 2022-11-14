import 'package:ecash/models/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionState with _$TransactionState{
  const factory TransactionState(
    AsyncValue<List<TransactionModel>> transactions
  ) = _TransactionState;

}