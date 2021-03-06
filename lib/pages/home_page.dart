import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecash/components/loading_screen.dart';
import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_drawer.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/components/user_waller_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/banner_data.dart';
import 'package:ecash/main.dart';
import 'package:ecash/pages/cash_in_page.dart';
import 'package:ecash/pages/pay_bills_page.dart';
import 'package:ecash/pages/pay_qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.onProfile}) : super(key: key);
  final VoidCallback onProfile;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => context.read(userProvider).startListener());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: PrimaryDrawer(
        onLogout: () async {
          Navigator.pop(context);
          context.read(userProvider).logOutUser();
        },
      ),
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            color: AppColor.background,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
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
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                                style: AppFont.regular(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            PrimaryIconButton(
                              icon: Icons.menu,
                              onTap: () => _scaffoldKey.currentState.openEndDrawer(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer(
                          builder: (context, watch, child) {
                            final user = watch(userProvider).user;
                            if (user != null) {
                              return UserWalletCard(
                                balance: user.wallet,
                                photoUrl: user.photo,
                                onTap: widget.onProfile,
                                accountNumber: user.accountNumber,
                                displayName: user.firstName + '' + ' ' + user.lastName,
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.lightGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PriamryButtonLabeled(
                                    asset: 'assets/cash_in.png',
                                    label: 'Cash In',
                                    onTap: () => Navigator.push(context, PageTransition(child: CashInPage(), type: PageTransitionType.bottomToTop)),
                                  ),
                                  PriamryButtonLabeled(
                                    asset: 'assets/request.png',
                                    label: 'Request \n money',
                                  ),
                                  PriamryButtonLabeled(
                                    asset: 'assets/money_transfer.png',
                                    label: 'Bank \n transfer',
                                  ),
                                  PriamryButtonLabeled(
                                    asset: 'assets/pay_bills.png',
                                    label: 'Pay \n bills',
                                    onTap: () => Navigator.push(context, PageTransition(child: PayBillsPage(), type: PageTransitionType.bottomToTop)),
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
                                  ),
                                  PriamryButtonLabeled(
                                    asset: 'assets/savings.png',
                                    label: 'Savings',
                                  ),
                                  PriamryButtonLabeled(
                                    asset: 'assets/credit.png',
                                    label: 'Credit',
                                  ),
                                  PriamryButtonLabeled(
                                    asset: 'assets/qr_icon.png',
                                    label: 'Pay QR',
                                    onTap: () => Navigator.push(context, PageTransition(child: PayQRScanner(), type: PageTransitionType.bottomToTop)),
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
                            style: AppFont.bold(
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
                            style: AppFont.regular(
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
                  Container(
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
                                  margin: EdgeInsets.only(
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
                            style: AppFont.bold(
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
                            style: AppFont.regular(
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
                            margin: EdgeInsets.only(
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
                          return Container(
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
                  Center(
                    child: Text(
                      'ECash Company 2022',
                      style: AppFont.regular(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              final loading = watch(userProvider).isLoading;
              if (loading) {
                return LoadingScreen();
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
