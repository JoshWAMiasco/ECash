import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/loading_screen.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/main.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:ecash/pages/success_transaction_page.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MeralcoBillPage extends ConsumerStatefulWidget {
  const MeralcoBillPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MeralcoBillPage> createState() => _MeralcoBillPageState();
}

class _MeralcoBillPageState extends ConsumerState<MeralcoBillPage> {
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
                                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
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
                              const PrimaryTextField(
                                hint: 'Account Number',
                                maxLength: 10,
                                
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: const Text(
                                    '10-digit Customer Account Number found at the upper left portion of the SAO.',
                                    style: TextStyle(
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
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: const Text(
                                    'Enter the total amount due on your bill',
                                    style: TextStyle(
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
                                onPressed: ()async {
                                  final user = ref.read(authProvider).user;
                                  double amount = double.tryParse(amountController.text) ?? 0;
                                  loadingIndicator(context);
                                  await ref.read(transactionProvider.notifier).paybill(amount, user!, 'Meraclo').then((isSuccess){
                                     if(isSuccess){
                                        Navigator.of(context, rootNavigator: false).pop();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessTransactionPage()));
                                      } else {
                                        Navigator.of(context, rootNavigator: false).pop();
                                        messageDialog(context, content: 'Went Something wrong');
                                      }
                                  });
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
          //     final isloading = context.read(userTransactions).isLoading;
          //     if (isloading) {
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
