import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/constants/functions.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key, this.title, this.description, this.amount, this.type,required this.date}) : super(key: key);
  final String? title;
  final String? description;
  final double? amount;
  final TransactionType? type;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    type == TransactionType.expense ? '- P ${moneyFormatter(amount ?? 0)}.00' : 'P ${moneyFormatter(amount ?? 0)}.00',
                    style: TextStyle(
                      fontSize: 13,
                      color: type == TransactionType.income ? AppColor.green : AppColor.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Text(
                  description ?? '',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  shortDateFormatter(date),
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
