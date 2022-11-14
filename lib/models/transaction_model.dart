import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecash/constants/enums.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {

  factory TransactionModel({
    String? title,
    String? description,
    double? amount,
    TransactionType? type,
    DateTime? date,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json)
    => _$TransactionModelFromJson(json);


}
