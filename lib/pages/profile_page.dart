import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/components/transaction_card.dart';
import 'package:ecash/components/user_profile_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/constants/functions.dart';
import 'package:ecash/pages/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key, this.onHome}) : super(key: key);
  final VoidCallback onHome;
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
              UserProfileCard(
                displayName: 'Grace Fate',
                profilePhoto: 'https://picsum.photos/200/300',
                mobileNumber: '+63 999-9999-999',
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
                    TransactionCard(
                      title: 'Cash In',
                      description: 'Cash in via 7-Eleven at Dasmarinas Cavite',
                      type: TransactionType.income,
                      amount: 50.00,
                      date: DateTime.now(),
                    ),
                    TransactionCard(
                      title: 'Money Receive',
                      description: 'You receive P200.00 from John Smith via bank transfer',
                      type: TransactionType.income,
                      amount: 200.00,
                      date: DateTime.now().subtract(Duration(days: 2)),
                    ),
                    TransactionCard(
                      title: 'Pay Bill',
                      description: 'You paid meralco bill with amount due of P1,500.00.',
                      type: TransactionType.expense,
                      amount: 200.00,
                      date: DateTime.now().subtract(Duration(
                        days: 20,
                      )),
                    ),
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
                    onPressed: onHome,
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
