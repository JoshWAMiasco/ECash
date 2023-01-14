import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/journal_item_model.dart';

class JournalBookModel {
  String? id;
  DateTime? date;
  double? totalCredit;
  double? totalDebit;
  List<JournalItemModel>? items;
  String? notes;

  JournalBookModel(
      {this.id,
      this.date,
      this.totalCredit,
      this.totalDebit,
      this.items,
      this.notes});

  JournalBookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'] != null ? (json['date'] as Timestamp).toDate() : null;
    totalCredit = json['totalCredit'];
    totalDebit = json['totalDebit'];
    if (json['items'] != null) {
      items = <JournalItemModel>[];
      json['items'].forEach((v) {
        items!.add(JournalItemModel.fromJson(v));
      });
    }
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['totalCredit'] = totalCredit;
    data['totalDebit'] = totalDebit;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['notes'] = notes;
    return data;
  }
}
