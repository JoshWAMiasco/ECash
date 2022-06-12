import 'package:ecash/components/loading_screen.dart';
import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/main.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class MeralcoBillPage extends StatelessWidget {
  MeralcoBillPage({Key key}) : super(key: key);
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: AppColor.background,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'You are paying',
                                  style: AppFont.semiBold(fontSize: 15, color: Colors.grey.shade500),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                'assets/meralco_logo.png',
                                height: 80,
                                width: 80,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              PrimaryTextField(
                                hint: 'Account Number',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    '10-digit Customer Account Number found at the upper left portion of the SAO.',
                                    style: AppFont.regular(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              PrimaryTextField(
                                hint: 'Amount',
                                controller: amountController,
                                textInputType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    'Enter the total amount due on your bill',
                                    style: AppFont.regular(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.info_rounded,
                                        color: AppColor.primary,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Remider',
                                        style: AppFont.semiBold(
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta ',
                                      style: AppFont.regular(
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              PrimaryButton(
                                title: 'Pay',
                                onPressed: () {
                                  final userWallet = context.read(userProvider).user.wallet;
                                  if (userWallet < double.parse(amountController.text)) {
                                    Toast.show('Sorry, Unsufficient Balance', context, duration: 3, gravity: Toast.TOP);
                                  } else {
                                    TransactionModel newTransaction = TransactionModel(
                                      amount: double.parse(amountController.text),
                                      date: DateTime.now(),
                                      description: 'You paid Meralco bill with amount of PHP ' + amountController.text,
                                      title: 'Pay Bill',
                                      type: TransactionType.expense,
                                    );
                                    context.read(userTransactions).addTransaction(
                                          context: context,
                                          currentUserWallet: userWallet,
                                          transaction: newTransaction,
                                          type: TransactionType.expense,
                                        );
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  PrimaryAppBar(
                    onBack: () => Navigator.pop(context),
                    title: 'Pay Bills',
                  ),
                ],
              ),
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              final isloading = context.read(userTransactions).isLoading;
              if (isloading) {
                return LoadingScreen();
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
