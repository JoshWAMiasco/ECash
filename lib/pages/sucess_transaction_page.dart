import 'dart:io';

import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/functions.dart';
import 'package:ecash/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SuccessTransactionPage extends StatelessWidget {
  SuccessTransactionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
                child: Container(
                  height: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Transaction Complete!',
                              style: AppFont.bold(fontSize: 20, color: AppColor.primary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta ',
                              style: AppFont.regular(fontSize: 12, color: Colors.grey.shade700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryButton(
                            onPressed: () => Navigator.pushReplacement(context, PageTransition(child: MainPage(), type: PageTransitionType.fade)),
                            title: 'Back to Home',
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
    );
  }
}
