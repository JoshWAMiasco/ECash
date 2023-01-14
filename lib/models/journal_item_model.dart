class JournalItemModel {
  String? debitCreditAccount;
  String? chartOfAccount;
  double? amount;

  JournalItemModel({this.debitCreditAccount, this.chartOfAccount, this.amount});

  JournalItemModel.fromJson(Map<String, dynamic> json) {
    debitCreditAccount = json['debitCreditAccount'];
    chartOfAccount = json['chartOfAccount'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['debitCreditAccount'] = debitCreditAccount;
    data['chartOfAccount'] = chartOfAccount;
    data['amount'] = amount;
    return data;
  }
}
