import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/pages/cash_in_via_card.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:ecash/pages/seven_eleven_recipt.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CashInViaSevenElevenPage extends StatelessWidget {
  const CashInViaSevenElevenPage({Key key}) : super(key: key);

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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Amount',
                        style: AppFont.semiBold(
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          'Provide an amount between PHP 100.00 up to PHP 10,000. Convenience fee may apply  ',
                          style: AppFont.regular(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    PrimaryButton(
                      onPressed: () => Navigator.push(context, PageTransition(child: SevenElevenReciptPage(), type: PageTransitionType.rightToLeft)),
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
