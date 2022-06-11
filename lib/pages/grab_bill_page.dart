import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GrabBillPage extends StatelessWidget {
  const GrabBillPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                            'assets/grab_logo.png',
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
                          PrimaryTextField(
                            hint: 'Amount',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Text(
                                'Biller Conveneince Fee (BCF) may apply',
                                style: AppFont.regular(
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
                              Text(
                                '+63',
                                style: AppFont.semiBold(
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
                            title: 'Continue',
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
    );
  }
}
