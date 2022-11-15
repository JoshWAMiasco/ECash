import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/components/transaction_card.dart';
import 'package:ecash/components/user_profile_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/photos.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:ecash/pages/transaction_page.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key, this.onHome}) : super(key: key);
  final VoidCallback? onHome;

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => ref.read(transactionProvider.notifier).getUserTransactionsHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.background,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              UserProfileCard(
                displayName: '${ref.watch(authProvider.notifier).getUserData()!.firstname} ${ref.watch(authProvider.notifier).getUserData()!.lastname!}',
                profilePhoto: ref.watch(authProvider.notifier).getUserData()!.profilePicture,
                mobileNumber: ref.watch(authProvider.notifier).getUserData()!.mobileNumber,
                userAccountNumber: '1234-1233-999',
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
                    onTap: (){},
                  ),
                  PriamryButtonLabeled(
                    asset: 'assets/book.png',
                    label: 'Quick \n Guide',
                    onTap: (){},
                  ),
                  PriamryButtonLabeled(
                    asset: 'assets/account.png',
                    label: 'Account \n Limit',
                    onTap: (){},
                  ),
                  PriamryButtonLabeled(
                    asset: 'assets/settings.png',
                    label: 'Settings',
                    onTap: (){},
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
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                    style: TextStyle(fontSize: 14),
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Transaction',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => context.router.pushNamed('/transactions'),
                            child: Text(
                              'see all',
                              style: TextStyle(
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
                    ref.watch(transactionProvider).transactions.when(
                      loading: () {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                            ),
                          ),
                        ); 
                      }, 
                      error: (_, stackTrace) {
                        return const Center(
                          child: Text(
                            'Went somethinf wrong',
                          ),
                        );
                      },
                      data: (transaction) {
                        if (transaction.isNotEmpty) {
                          List<TransactionModel> recentList = <TransactionModel>[];
                          for (int count = 0; count < 3; count++) {
                            try {
                              recentList.add(transaction[count]);
                            } catch (e) {}
                          }
                          return Column(
                            children: List.generate(recentList.length, (index) {
                              return TransactionCard(
                                amount: recentList[index].amount,
                                date: recentList[index].date!,
                                description: recentList[index].description,
                                title: recentList[index].title,
                                type: recentList[index].type,
                              );
                            }),
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'No transaction yet.'
                            ),
                          );
                        }
                      }
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
                    onPressed: widget.onHome,
                    child: Row(
                      children: const [
                       Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          'Back to Home',
                          style: TextStyle(
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
