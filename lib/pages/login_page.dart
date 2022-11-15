
import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/providers/providers.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController mpinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            color: AppColor.background,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Align(
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
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
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
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
                      child: const  Text(
                        '+63',
                        style: TextStyle(
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
                        maxLength: 11,
                        keyboardType: TextInputType.phone,
                        controller: mobileNumberController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                          ),
                          counterText: "",
                          contentPadding: const  EdgeInsets.only(
                            left: 10,
                            bottom: 10,
                          ),
                        ),
                        style: TextStyle(color: AppColor.primary, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        maxLength: 4,
                        keyboardType: TextInputType.phone,
                        controller: mpinController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: 'Mpin',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                          ),
                          counterText: "",
                          contentPadding: const  EdgeInsets.only(
                            left: 10,
                            bottom: 10,
                          ),
                        ),
                        style: TextStyle(color: AppColor.primary, fontSize: 25),
                      ),
                    ),
                Expanded(child: Container()),
                PrimaryButton(
                  onPressed: () async {
                    String mobile = mobileNumberController.text;
                    String mpin = mpinController.text;
                    if(mobile.isNotEmpty || mpin.isNotEmpty){
                      if(mobile.length == 11 && mobile.startsWith('0')){
                        loadingIndicator(context);
                        await ref.read(authProvider.notifier).login(mobile, mpin).then((res){
                          if(res.failure) {
                            Navigator.of(context, rootNavigator: false).pop();
                            messageDialog(context, content: res.message);
                          } else {
                            Navigator.of(context, rootNavigator: false).pop();
                            AutoRouter.of(context).replaceNamed('/main');
                          }
                        });
                      } else {
                        messageDialog(context, content: 'Invalid number');
                      }
                    } else {
                      messageDialog(context, content: 'Please fill up all fields');
                    }
                  },
                  title: 'Login',
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
