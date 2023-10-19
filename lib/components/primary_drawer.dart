import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';

class PrimaryDrawer extends StatelessWidget {
  const PrimaryDrawer({Key? key, this.onLogout}) : super(key: key);
  final VoidCallback? onLogout;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        color: AppColor.primary,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
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
                  const AssetImage('assets/ecash_logo.png'),
                  size: 100,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Ecash',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'v 1.0.0',
                      style: TextStyle(
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
            SizedBox(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Align(
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
            SizedBox(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Service',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Align(
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
            SizedBox(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20),
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'FAQ\'s',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Align(
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
              child: SizedBox(
                height: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20),
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Align(
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
