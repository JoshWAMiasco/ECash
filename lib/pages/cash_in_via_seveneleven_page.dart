import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/pages/cash_in_via_card.dart';
import 'package:ecash/pages/page_info_wrapper.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:ecash/pages/seven_eleven_recipt.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toast/toast.dart';

class CashInViaSevenElevenPage extends ConsumerStatefulWidget {
 const CashInViaSevenElevenPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CashInViaSevenElevenPage> createState() => _CashInViaSevenElevenPageState();
}

class _CashInViaSevenElevenPageState extends ConsumerState<CashInViaSevenElevenPage> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: AppColor.background,
        child: SafeArea(
          child: Column(
            children: [
              PrimaryAppBar(
                onBack: () => Navigator.pop(context),
                title: 'Cash In / 7-Eleven',
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      hint: 'Amount',
                      textInputType: TextInputType.number,
                      controller: amountController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: const Text(
                          'Provide an amount between PHP 100.00 up to PHP 10,000. Convenience fee may apply  ',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    PrimaryButton(
                      onPressed: () async {
                        if (amountController.text != "") {
                          double amount = double.tryParse(amountController.text) ?? 0;
                          loadingIndicator(context);
                          final user = ref.read(authProvider).getUserData()!;
                          await ref.read(transactionProvider.notifier).cashInViaSevenEleven(amount, user).then((isSuccess){
                            if(isSuccess){
                              Navigator.of(context, rootNavigator: false).pop();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SevenElevenReciptPage(amount: amount,)));
                            } else {
                              Navigator.of(context, rootNavigator: false).pop();
                              messageDialog(context, content: 'Cash in failed');
                            }
                          });
                          
                        } else {
                          Toast.show("Please enter amount", duration: 2, gravity: Toast.top);
                        }
                      },
                      title: 'Continue',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
