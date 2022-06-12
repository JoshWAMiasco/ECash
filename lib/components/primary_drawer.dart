import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:flutter/material.dart';

class PrimaryDrawer extends StatelessWidget {
  const PrimaryDrawer({Key key, this.onLogout}) : super(key: key);
  final VoidCallback onLogout;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        color: AppColor.primary,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ImageIcon(
                  AssetImage('assets/ecash_logo.png'),
                  size: 100,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Ecash',
                      style: AppFont.bold(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'v 1.0.0',
                      style: AppFont.regular(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'About Us',
                      style: AppFont.regular(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: PrimaryIconButton(
                        icon: Icons.info,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Service',
                      style: AppFont.regular(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: PrimaryIconButton(
                        icon: Icons.miscellaneous_services,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'FAQ\'s',
                      style: AppFont.regular(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: PrimaryIconButton(
                        icon: Icons.question_answer_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onLogout,
              child: Container(
                height: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20),
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Logout',
                        style: AppFont.regular(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: PrimaryIconButton(
                          icon: Icons.exit_to_app_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
