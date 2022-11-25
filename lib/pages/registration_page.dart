import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/password_textfield.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_utils.dart';
import 'package:ecash/constants/image.dart';
import 'package:ecash/models/user_model.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegistrationPage extends ConsumerWidget {
  RegistrationPage({Key? key}) : super(key: key);
  final TextEditingController userName = TextEditingController();
  final TextEditingController realName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 17.sp, right: 17.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Registration',
                      style: GoogleFonts.charmonman(
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                        fontSize: 25.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () => context.router.pop(),
                      child: Icon(
                        Icons.close,
                        color: AppColor.primary,
                        size: 20.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SvgPicture.asset(
                  classicDivider,
                ),
                SizedBox(
                  height: 5.h,
                ),
                PrimaryTextField(
                  hint: 'Username',
                  controller: userName,
                ),
                SizedBox(
                  height: 2.h,
                ),
                PrimaryTextField(
                  hint: 'Name (Optional)',
                  controller: realName,
                ),
                SizedBox(
                  height: 2.h,
                ),
                PasswordTextField(
                  hint: 'Password',
                  controller: password,
                ),
                SizedBox(
                  height: 2.h,
                ),
                PasswordTextField(
                  hint: 'Confirm Password',
                  controller: confirmPassword,
                ),
                SizedBox(
                  height: 10.h,
                ),
                PrimaryButton(
                  title: 'Register',
                  onPressed: () async {
                    if (userName.text.isNotEmpty && password.text.isNotEmpty && confirmPassword.text.isNotEmpty) {
                      if (password.text == confirmPassword.text) {
                        if (password.text.length >= 6) {
                          UserModel newUSer = UserModel(
                            beansPoint: 0,
                            dateCreated: DateTime.now(),
                            password: password.text,
                            qrCode: AppUtils.encrypt(userName.text),
                            realName: realName.text,
                            userName: userName.text,
                            authKey: 'password',
                          );
                          loadingIndicator(context);
                          try {
                            await ref.read(authProvider.notifier).register(newUSer).then((res) {
                              if (res.failure == false) {
                                Navigator.of(context, rootNavigator: true).pop();
                                messageDialog(context, content: 'Success');
                              } else {
                                Navigator.of(context, rootNavigator: true).pop();
                                messageDialog(context, content: res.message);
                              }
                            });
                          } catch (e) {
                            Navigator.of(context, rootNavigator: true).pop();
                            messageDialog(context, content: 'Something went wrong');
                          }
                        } else {
                          messageDialog(context, content: 'Password should be minimum of 6 character length');
                        }
                      } else {
                        messageDialog(context, content: 'Password did not match');
                      }
                    } else {
                      messageDialog(context, content: 'Please complete your details before sumbit');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
