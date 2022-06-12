import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/components/transaction_card.dart';
import 'package:ecash/components/user_profile_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/constants/functions.dart';
import 'package:ecash/main.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:ecash/pages/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key, this.onHome}) : super(key: key);
  final VoidCallback onHome;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => context.read(userTransactions).getTransactions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.background,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Consumer(
                builder: (context, watch, child) {
                  final user = context.read(userProvider).user;
                  return UserProfileCard(
                    displayName: user.firstName + ' ' + user.lastName,
                    profilePhoto: user.photo,
                    mobileNumber: user.mobile,
                    userAccountNumber: user.accountNumber,
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriamryButtonLabeled(
                    asset: 'assets/heart.png',
                    label: 'Favorites',
                  ),
                  PriamryButtonLabeled(
                    asset: 'assets/book.png',
                    label: 'Quick \n Guide',
                  ),
                  PriamryButtonLabeled(
                    asset: 'assets/account.png',
                    label: 'Account \n Limit',
                  ),
                  PriamryButtonLabeled(
                    asset: 'assets/settings.png',
                    label: 'Settings',
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                    style: AppFont.regular(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction',
                            style: AppFont.bold(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context, PageTransition(child: TransactionPage(), type: PageTransitionType.rightToLeft)),
                            child: Text(
                              'see all',
                              style: AppFont.regular(
                                fontSize: 12,
                                color: AppColor.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Consumer(
                      builder: (context, watch, child) {
                        final transaction = watch(userTransactions);
                        if (transaction.isLoading) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                              ),
                            ),
                          );
                        }
                        if (transaction.listOfTransaction.isNotEmpty) {
                          List<TransactionModel> recentList = <TransactionModel>[];
                          for (int count = 0; count < 3; count++) {
                            try {
                              recentList.add(transaction.listOfTransaction[count]);
                            } catch (e) {}
                          }
                          return Column(
                            children: List.generate(recentList.length, (index) {
                              return TransactionCard(
                                amount: recentList[index].amount,
                                date: recentList[index].date,
                                description: recentList[index].description,
                                title: recentList[index].title,
                                type: recentList[index].type,
                              );
                            }),
                          );
                        }
                        return Center(
                          child: Text(
                            'No Transaction Yet.',
                            style: AppFont.bold(fontSize: 18, color: Colors.grey),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 150,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: widget.onHome,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          'Back to Home',
                          style: AppFont.bold(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
