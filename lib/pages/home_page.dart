import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/loading_screen.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_drawer.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/components/user_waller_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/banner_data.dart';
import 'package:ecash/constants/photos.dart';
import 'package:ecash/main.dart';
import 'package:ecash/pages/cash_in_page.dart';
import 'package:ecash/pages/pay_bills_page.dart';
import 'package:ecash/pages/pay_qr_scanner.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key, this.onProfile}) : super(key: key);
  final VoidCallback? onProfile;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      endDrawer: PrimaryDrawer(
        onLogout: () async {
          loadingIndicator(context);
          await ref.read(authProvider).logout().then((res){
            if(res.failure){
              Navigator.of(context, rootNavigator: false).pop();
              messageDialog(context, content: res.message);
            } else {
              Navigator.of(context, rootNavigator: false).pop();
              context.router.popUntil((route) => route.isFirst);
            }
          });
          
        },
      ),
      key: _scaffoldKey,
      body: Container(
        color: AppColor.background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        PrimaryIconButton(
                          icon: Icons.menu,
                          onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    UserWalletCard(
                      balance: ref.watch(authProvider).getUserData()!.walletBalance,
                      photoUrl: profilePlaceHolder,
                      onTap: widget.onProfile,
                      accountNumber: ref.watch(authProvider).getUserData()!.mobileNumber,
                      displayName: '${ref.watch(authProvider).getUserData()!.firstname} ${ref.watch(authProvider).getUserData()!.lastname!}'
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.lightGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PriamryButtonLabeled(
                                asset: 'assets/cash_in.png',
                                label: 'Cash In',
                                onTap: () => context.router.pushNamed('/cash-in'),
                              ),
                              PriamryButtonLabeled(
                                asset: 'assets/request.png',
                                label: 'Request \n money',
                                onTap: (){},
                              ),
                              PriamryButtonLabeled(
                                asset: 'assets/money_transfer.png',
                                label: 'Bank \n transfer',
                                onTap: (){},
                              ),
                              PriamryButtonLabeled(
                                asset: 'assets/pay_bills.png',
                                label: 'Pay \n bills',
                                onTap: () => context.router.pushNamed('/pay-bills'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PriamryButtonLabeled(
                                asset: 'assets/load.png',
                                label: 'Load',
                                onTap: (){},
                              ),
                              PriamryButtonLabeled(
                                asset: 'assets/savings.png',
                                label: 'Savings',
                                onTap: (){},
                              ),
                              PriamryButtonLabeled(
                                asset: 'assets/credit.png',
                                label: 'Credit',
                                onTap: (){},
                              ),
                              PriamryButtonLabeled(
                                asset: 'assets/qr_icon.png',
                                label: 'Pay QR',
                                onTap: () => context.router.pushNamed('/pay-qr-scanner'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'What\'s New ?',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 80,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(BannerData.news.length, (index) {
                      return CachedNetworkImage(
                        imageUrl: BannerData.news[index],
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            height: 80,
                            width: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                        placeholder: (context, url) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.white.withOpacity(0.7),
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              height: 80,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Announcement',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2,
                  pauseAutoPlayOnTouch: true,
                ),
                items: List.generate(BannerData.announcement.length, (index) {
                  return CachedNetworkImage(
                    imageUrl: BannerData.announcement[index],
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white.withOpacity(0.7),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'ECash Company 2022',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
