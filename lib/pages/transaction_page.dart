import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/transaction_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/enums.dart';
import 'package:flutter/material.dart';

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
                      child: Column(
                        children: List.generate(
                          20,
                          (index) => TransactionCard(
                            amount: 200.00,
                            date: DateTime.now().subtract(Duration(days: index + 1)),
                            title: 'Cash In',
                            description: 'Lorem Ipsum',
                            type: TransactionType.income,
                          ),
                        ),
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
