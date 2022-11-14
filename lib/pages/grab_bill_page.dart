
import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';

import 'package:ecash/pages/primary_textfield.dart';
import 'package:flutter/material.dart';

class GrabBillPage extends StatefulWidget {
  const GrabBillPage({Key? key}) : super(key: key);

  @override
  State<GrabBillPage> createState() => _GrabBillPageState();
}

class _GrabBillPageState extends State<GrabBillPage> {
  final TextEditingController amountController = TextEditingController();

  final TextEditingController accountController = TextEditingController();

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
                                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                'assets/grab_logo.png',
                                height: 80,
                                width: 80,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              PrimaryTextField(
                                hint: 'Account Number',
                                controller: accountController,
                              ),
                              const SizedBox(
                                height: 10,
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
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: const Text(
                                    'Biller Conveneince Fee (BCF) may apply',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '+63',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  PrimaryTextField(
                                    width: MediaQuery.of(context).size.width * 0.75,
                                    hint: 'Mobile Number',
                                    maxLength: 10,
                                    textInputType: TextInputType.phone,
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
                                      const Text(
                                        'Remider',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta ',
                                      style: TextStyle(
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
                                  // final userWallet = context.read(userProvider).user.wallet;
                                  // if (userWallet < double.parse(amountController.text)) {
                                  //   Toast.show('Sorry, Unsufficient Balance', context, duration: 3, gravity: Toast.TOP);
                                  // } else {
                                  //   TransactionModel newTransaction = TransactionModel(
                                  //     amount: double.parse(amountController.text),
                                  //     date: DateTime.now(),
                                  //     description: 'You paid Grab bill with amount of PHP ' + amountController.text,
                                  //     title: 'Pay Bill',
                                  //     type: TransactionType.expense,
                                  //   );
                                  //   context.read(userTransactions).addTransaction(
                                  //         context: context,
                                  //         currentUserWallet: userWallet,
                                  //         transaction: newTransaction,
                                  //         type: TransactionType.expense,
                                  //       );
                                  // }
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
          // Consumer(
          //   builder: (context, watch, child) {
          //     final isLoading = watch(userTransactions).isLoading;
          //     if (isLoading) {
          //       return LoadingScreen();
          //     }
          //     return const SizedBox();
          //   },
          // )
        ],
      ),
    );
  }
}
