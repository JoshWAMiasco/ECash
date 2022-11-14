import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/main.dart';
import 'package:ecash/pages/home_page.dart';
import 'package:ecash/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OtpPage extends StatelessWidget {
  final TextEditingController mobileNumberController = TextEditingController();
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
                style: TextStyle(
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
                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer(
              builder: (context, watch, child) {
                final otp = null; // watch(userProvider).fakeOtp;
                if (otp != null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(otp.length, (index) {
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
                              String.fromCharCode(otp.runes.toList()[index]),
                              style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
                return Row(
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
                        child: const SizedBox(),
                      ),
                    );
                  }),
                );
              },
            ),
            Expanded(child: Container()),
            Consumer(builder: (context, watch, child) {
              final otp = null; // context.read(userProvider).fakeOtp;
              return Opacity(
                opacity: otp == "" ? 0.5 : 1,
                child: PrimaryButton(
                  onPressed: () {
                    // if (otp != "") {
                    //   NavigationService().navigateToScreen(
                    //     page: MainPage(),
                    //     type: PageTransitionType.rightToLeft,
                    //   );
                    // }
                  },
                  title: 'Continue',
                ),
              );
            }),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
