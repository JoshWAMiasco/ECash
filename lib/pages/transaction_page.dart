import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/transaction_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColor.background,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Consumer(
                        builder: (context, watch, child) {
                          final transaction = watch(userTransactions);
                          if (transaction.isLoading) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                                ),
                              ),
                            );
                          }
                          if (transaction.listOfTransaction.isNotEmpty) {
                            return Column(
                              children: List.generate(transaction.listOfTransaction.length, (index) {
                                return TransactionCard(
                                  amount: transaction.listOfTransaction[index].amount,
                                  date: transaction.listOfTransaction[index].date,
                                  description: transaction.listOfTransaction[index].description,
                                  title: transaction.listOfTransaction[index].title,
                                  type: transaction.listOfTransaction[index].type,
                                );
                              }),
                            );
                          }
                          return Center(
                            child: Text(
                              'No Transaction Yet',
                              style: AppFont.bold(color: Colors.grey, fontSize: 20),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              PrimaryAppBar(
                onBack: () => Navigator.pop(context),
                title: 'Transaction',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
