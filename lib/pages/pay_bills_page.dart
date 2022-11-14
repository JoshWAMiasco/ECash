import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/pages/cash_in_via_card.dart';
import 'package:ecash/pages/cash_in_via_seveneleven_page.dart';
import 'package:ecash/pages/grab_bill_page.dart';
import 'package:ecash/pages/home_credit_billpage.dart';
import 'package:ecash/pages/meralco_bill_page.dart';
import 'package:flutter/material.dart';

class PayBillsPage extends StatelessWidget {
  const PayBillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: AppColor.background,
          child: Column(
            children: [
              PrimaryAppBar(
                onBack: () => Navigator.pop(context),
                title: 'Pay Bills',
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Our Support Payment',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          'Select your preferred partner to learn more.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 20,
                      spacing: 10,
                      children: [
                        PriamryButtonLabeled(
                          asset: 'assets/meralco_logo.png',
                          label: 'Mercalco',
                          large: true,
                          //onTap: () => Navigator.push(context, PageTransition(child: MeralcoBillPage(), type: PageTransitionType.rightToLeft)),
                        ),
                        PriamryButtonLabeled(
                          asset: 'assets/grab_logo.png',
                          label: 'Grab',
                          large: true,
                          //onTap: () => Navigator.push(context, PageTransition(child: GrabBillPage(), type: PageTransitionType.rightToLeft)),
                        ),
                        PriamryButtonLabeled(
                          asset: 'assets/home_credit_logo.png',
                          label: 'Home Credit',
                          large: true,
                          //onTap: () => Navigator.push(context, PageTransition(child: HomeCreditBillPage(), type: PageTransitionType.rightToLeft)),
                        ),
                      ],
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
