import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/constants/enums.dart';

class TransactionModel {
  String title;
  String description;
  double amount;
  TransactionType type;
  DateTime date;

  TransactionModel({
    this.amount,
    this.date,
    this.description,
    this.title,
    this.type,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    this.amount = (json['amount'] ?? 0).toDouble();
    this.title = json['title'] ?? '';
    this.description = json['description'] ?? '';
    if (json['type'] != null) {
      switch (json['type']) {
        case 'income':
          this.type = TransactionType.income;
          break;
        case 'expense':
          this.type = TransactionType.expense;
          break;
        default:
      }
    } else {
      this.type = TransactionType.unknown;
    }
    this.date = json['date'] != null ? (json['date'] as Timestamp).toDate() : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['amount'] = this.amount;
    data['title'] = this.title;
    data['description'] = this.description;
    switch (this.type) {
      case TransactionType.income:
        data['type'] = 'income';
        break;
      case TransactionType.expense:
        data['type'] = 'expense';
        break;
      default:
    }
    data['date'] = Timestamp.fromDate(this.date);
    return data;
  }
}
