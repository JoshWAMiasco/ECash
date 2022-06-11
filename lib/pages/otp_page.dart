import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/pages/home_page.dart';
import 'package:ecash/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key key}) : super(key: key);

  TextEditingController mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        color: AppColor.background,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image(
                image: AssetImage('assets/ecash_app_icon.png'),
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'OTP',
                style: AppFont.bold(
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please enter the One-Time-Password (OTP). \n we sent to +63 999-9999-999',
                style: AppFont.regular(fontSize: 14, color: Colors.grey.shade800),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: AppFont.bold(
                          color: AppColor.primary,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            Expanded(child: Container()),
            PrimaryButton(
              onPressed: () {
                Navigator.pushReplacement(context, PageTransition(child: MainPage(), type: PageTransitionType.fade));
              },
              title: 'Continue',
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
