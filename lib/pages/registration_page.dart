import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/password_textfield.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                ),
                SizedBox(
                  height: 2.h,
                ),
                PrimaryTextField(
                  hint: 'Name (Optional)',
                ),
                SizedBox(
                  height: 2.h,
                ),
                PasswordTextField(
                  hint: 'Password',
                ),
                SizedBox(
                  height: 2.h,
                ),
                PasswordTextField(
                  hint: 'Confirm Password',
                ),
                SizedBox(
                  height: 10.h,
                ),
                PrimaryButton(
                  title: 'Register',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
