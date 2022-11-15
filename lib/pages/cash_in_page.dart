import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/pages/cash_in_via_seveneleven_page.dart';
import 'package:flutter/material.dart';

class CashInPage extends StatelessWidget {
  const CashInPage({Key? key}) : super(key: key);

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
                title: 'Cash In',
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      //onTap: () => Navigator.push(context, PageTransition(child: CashInViaCardPage(), type: PageTransitionType.rightToLeft)),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.credit_card_rounded,
                                  color: AppColor.primary,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Debit or Credit Card',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColor.primary,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Out Partners',
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
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: const Text(
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
                          asset: 'assets/seven_eleven_logo.png',
                          label: '7-Eleven',
                          large: true,
                          onTap: () {
                            
                            context.router.pushNamed('/cash-in-via-seven-eleven');
                          }
                        ),
                        PriamryButtonLabeled(
                          asset: 'assets/union_bank_logo.png',
                          label: 'UnionBank',
                          large: true,
                          onTap: (){},
                        ),
                        PriamryButtonLabeled(
                          asset: 'assets/sm_logo.png',
                          label: 'The Sm Store',
                          large: true,
                          onTap: (){},
                        ),
                        PriamryButtonLabeled(
                          asset: 'assets/ecpay_logo.png',
                          label: 'ECPay',
                          large: true,
                          onTap: (){},
                        ),
                        PriamryButtonLabeled(
                          asset: 'assets/cebuana_logo.png',
                          label: 'Cabuana Lhuillier',
                          large: true,
                          onTap: (){},
                        ),
                        PriamryButtonLabeled(
                          asset: 'assets/bdo_logo.png',
                          label: 'BDO',
                          large: true,
                          onTap: (){},
                        ),
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
                              'About Cash In',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta ',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
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
