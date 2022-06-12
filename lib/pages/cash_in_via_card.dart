import 'dart:developer';

import 'package:ecash/components/cash_in_selection.dart';
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

class CashInViaCardPage extends StatelessWidget {
  const CashInViaCardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
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
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Choose from amount below (PHP)',
                                  style: AppFont.semiBold(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // todo
                              CashInSelection(
                                onChange: (value) {
                                  amountController.text = value.toString();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    'A Php 200.00 convenience fee for this service will be added and reflected in the confirmation page.',
                                    style: AppFont.regular(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Card Details',
                                  style: AppFont.semiBold(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/card_icon.png',
                                    height: 25,
                                    width: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  PrimaryTextField(
                                    textInputType: TextInputType.number,
                                    maxLength: 14,
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    hint: 'Card Number',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Valid Thru',
                                  style: AppFont.semiBold(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PrimaryTextField(
                                    textInputType: TextInputType.number,
                                    maxLength: 2,
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    hint: 'Month',
                                  ),
                                  PrimaryTextField(
                                    textInputType: TextInputType.number,
                                    maxLength: 4,
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    hint: 'Year',
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PrimaryTextField(
                                    textInputType: TextInputType.number,
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    maxLength: 3,
                                    hint: 'CVV/CSV',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/cvv_icon.png',
                                    height: 25,
                                    width: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
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
                                        'About Cash In',
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
                                title: 'Continue',
                                onPressed: () {
                                  TransactionModel newTransaction = TransactionModel(
                                    amount: double.parse(amountController.text),
                                    date: DateTime.now(),
                                    description: 'cash in via credit card with the amount of PHP ' + amountController.text,
                                    title: 'Cash In',
                                    type: TransactionType.income,
                                  );
                                  final userWallet = context.read(userProvider).user.wallet;
                                  context.read(userTransactions).addTransaction(
                                        context: context,
                                        currentUserWallet: userWallet,
                                        transaction: newTransaction,
                                        type: TransactionType.income,
                                      );
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
                    title: 'Cash In / Debit or Credit',
                  ),
                ],
              ),
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              final isloading = watch(userTransactions).isLoading;
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
