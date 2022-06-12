import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/components/loading_screen.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/constants/functions.dart';
import 'package:ecash/main.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:ecash/pages/sucess_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:toast/toast.dart';

class QrPaymentResult extends StatelessWidget {
  QrPaymentResult({Key key, this.amount}) : super(key: key);
  final double amount;
  @override
  Widget build(BuildContext context) {
    final userWallet = context.read(userProvider).user.wallet;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30, top: 50),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
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
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PrimaryButton(
                              title: 'Pay',
                              onPressed: () {
                                if (userWallet < amount) {
                                  Toast.show('Sorry, Unsufficient Balance', context, duration: 3, gravity: Toast.TOP);
                                } else {
                                  TransactionModel newTransaction = TransactionModel(
                                    amount: amount,
                                    date: DateTime.now(),
                                    description: 'You paid Meralco bill with amount of PHP ' + amount.toString(),
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
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
                    child: Container(
                      height: 350,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: CachedNetworkImage(
                                  imageUrl: 'https://picsum.photos/200/300',
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: 80,
                                      width: 85,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      )),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  'Align Puring Store',
                                  style: AppFont.bold(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Your Wallet',
                                      style: AppFont.semiBold(fontSize: 15, color: Colors.grey.shade600),
                                    ),
                                    Text(
                                      'PHP ' + moneyFormatter(userWallet),
                                      style: AppFont.regular(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Amount to be paid',
                                      style: AppFont.semiBold(fontSize: 15, color: Colors.grey.shade600),
                                    ),
                                    Text(
                                      '- PHP ' + moneyFormatter(amount),
                                      style: AppFont.regular(
                                        fontSize: 14,
                                        color: AppColor.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.grey.shade500,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        'Your Balance after this transaction',
                                        style: AppFont.semiBold(fontSize: 15, color: Colors.grey.shade600),
                                      ),
                                    ),
                                    Text(
                                      'PHP ' + moneyFormatter(userWallet - amount),
                                      style: AppFont.regular(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              final isloading = watch(userProvider).isLoading;
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
