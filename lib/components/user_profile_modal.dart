import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/popup_card.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserProfileModal extends StatelessWidget {
  const UserProfileModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupCard(
      borderRadius: 20,
      margin: EdgeInsets.fromLTRB(15.w, 25.h, 15.w, 22.h),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
              child: QrImage(
                data: 'Sample User Account',
                version: QrVersions.auto,
                size: 220,
                gapless: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Joshua Miasco',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: Text(
                'Beans Point: 200',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
              title: "Close",
              onPressed: () => context.router.pop(),
            )
          ],
        ),
      ),
    );
  }
}
