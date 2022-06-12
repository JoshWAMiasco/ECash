import 'dart:developer';

import 'package:ecash/components/loading_screen.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/main.dart';
import 'package:ecash/pages/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  final TextEditingController mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
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
                    'Login',
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
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
                    style: AppFont.regular(fontSize: 14, color: Colors.grey.shade800),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '+63',
                        style: AppFont.bold(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        controller: mobileNumberController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: 'Mobile Number',
                          hintStyle: AppFont.regular(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                          ),
                          counterText: "",
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            bottom: 10,
                          ),
                        ),
                        style: AppFont.semiBold(color: AppColor.primary, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                PrimaryButton(
                  onPressed: () {
                    context.read(userProvider).logIn("0" + mobileNumberController.text, context);
                  },
                  title: 'Login',
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              final isLaoding = watch(userProvider).isLoading;
              if (isLaoding) {
                return LoadingScreen();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
