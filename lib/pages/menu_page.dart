import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:ecash/components/cart_card.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/menu_card.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:ecash/models/cart_item_model.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuPage extends ConsumerStatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => ref.read(productProvider).getProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            height: 100.h, 
            width: 100.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: Text(
                      'Menu',
                      style: GoogleFonts.charmonman(fontWeight: FontWeight.bold, fontSize: 25.sp, color: AppColor.primary),
                    ),
                  ),
                  SvgPicture.asset(
                    classicDivider,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ref.watch(productProvider).products.when(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    data: (products) {
                      if (products.isEmpty) {
                        return Center(
                          child: Text(
                            'No Available Product',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        );
                      }
                      return Column(
                        children: List.generate(
                          products.length,
                          (index) => MenuCard(
                            product: products[index],
                          ),
                        ),
                      );
                    },
                    error: (error, stact) {
                      return const Center(
                        child: Text(
                          'Something went wrong',
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(17.sp, 5.h, 17.sp, 0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ref.watch(authProvider).user != null
                      ? Badge(
                          badgeContent: const Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ),
                          child: InkWell(
                            onTap: () {
                              context.router.pushNamed('/menu');
                            },
                            child: Container(
                              height: 25.sp,
                              width: 25.sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primary,
                              ),
                              child: Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  InkWell(
                    onTap: () => context.router.pop(),
                    child: Icon(
                      Icons.close,
                      color: AppColor.primary,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
