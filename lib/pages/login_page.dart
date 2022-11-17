import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/password_textfield.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:ecash/providers/providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            Container(
              height: 100.h,
              width: 50.w,
              color: AppColor.secondary,
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Winter Brewed',
                      style: GoogleFonts.charmonman(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                        color: AppColor.primary,
                      ),
                    ),
                    const Center(
                      child: Image(
                        image: AssetImage(
                          appLogo,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SvgPicture.asset(
                      classicDivider,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 25.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.sp),
                              bottomRight: Radius.circular(15.sp),
                            )),
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            PrimaryTextField(
                              hint: 'ex. winterCoffee01',
                              controller: username,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            PasswordTextField(
                              hint: '******',
                              controller: password,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: TextButton(
                          onPressed: () async {
                            if (username.text.isNotEmpty && password.text.isNotEmpty) {
                              loadingIndicator(context);
                              await ref.read(authProvider).login(username.text, password.text).then((res) {
                                if (res.failure == false) {
                                  Navigator.of(context, rootNavigator: true).pop();
                                  context.router.popUntilRoot();
                                } else {
                                  Navigator.of(context, rootNavigator: true).pop();
                                  messageDialog(context, content: res.message);
                                }
                              });
                            } else {
                              messageDialog(context, content: 'Please conplete details');
                            }
                          },
                          style: TextButton.styleFrom(backgroundColor: AppColor.primary, padding: EdgeInsets.fromLTRB(20.sp, 5.sp, 20.sp, 5.sp)),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.sp),
                        child: Text(
                          'v 1.0.0',
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5.h,
              right: 5.w,
              child: InkWell(
                onTap: () => context.router.pop(),
                child: Icon(
                  Icons.close,
                  color: AppColor.primary,
                  size: 20.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
