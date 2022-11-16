import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/ripple_animation.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/pages/login_page.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RootPage extends ConsumerStatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  @override
  void initState() {
    super.initState();
    checkIsLogin();
  }

  void checkIsLogin() async {
    final res = await ref.read(authProvider.notifier).checkIsLogin();
    if (res.failure) {
      await context.router.replaceNamed('/main');
    } else {
      ref.read(authProvider.notifier).listenToUserData();
      await context.router.replaceNamed('/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColor.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  //onTap: () => Navigator.push(context, PageTransition(child: LoginPage(), type: PageTransitionType.fade)),
                  child: ImageIcon(
                    const AssetImage('assets/ecash_logo.png'),
                    size: 150,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'ECash',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: RippleAnimation(),
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'version 1.0.0',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
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
