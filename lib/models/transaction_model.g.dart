// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionModel _$$_TransactionModelFromJson(Map<String, dynamic> json) =>
    _$_TransactionModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_TransactionModelToJson(_$_TransactionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'amount': instance.amount,
      'type': _$TransactionTypeEnumMap[instance.type],
      'date': instance.date?.toIso8601String(),
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
  TransactionType.unknown: 'unknown',
};
