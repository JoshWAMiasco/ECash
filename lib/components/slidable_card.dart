
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:responsive_sizer/responsive_sizer.dart';

class SlidableCard extends StatefulWidget {
  const SlidableCard({Key? key}) : super(key: key);
  @override
  State<SlidableCard> createState() =>  _SlidableCardState();
}

class _SlidableCardState extends State<SlidableCard> {
  double _page = 10;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    PageController pageController;
    pageController = PageController(initialPage: 10);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!;
            print(_page.toString());
          },
        );
      },
    );

    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: width,
            width: width * .95,
            child: LayoutBuilder(
              builder: (context, boxConstraints) {
                List<Widget> cards = <Widget>[];

                for (int i = 0; i <= 10; i++) {
                  double currentPageValue = i - _page;
                  bool pageLocation = currentPageValue > 0;

                  double start = 20 +
                      max(
                          (boxConstraints.maxWidth - width * .75) -
                              ((boxConstraints.maxWidth - width * .75) / 2) *
                                  -currentPageValue *
                                  (pageLocation ? 9 : 1),
                          0.0);

                  int? currentIndex;
                  int? currentPage;
                  if(currentPageValue.isNegative == false){
                    currentIndex = currentPageValue.toInt();
                    print('index: $currentIndex');
                    print('i: ${(_page - 10).abs()}');
                    currentPage = (_page.toInt() - 10).abs();
                  }



                  var customizableCard = Positioned.directional(
                    top: 20 + 30 * max(-currentPageValue, 0.0),
                    bottom: 20 + 30 * max(-currentPageValue, 0.0),
                    start: start,
                    textDirection: TextDirection.ltr,
                    child: Container(
                        height: width * .67,
                        width: width * .67,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                            color: AppColor.ligthBlue,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.15),
                                  blurRadius: 10)
                            ],
                        ),
                        child:  Builder(
                          builder: (context) {
                            if(currentIndex != currentPage){
                              return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: 'https://picsum.photos/200/300',
                                  imageBuilder: (context, imageProvider){
                                    return Container(
                                      height: 20.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.sp),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        )
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Product Title',
                                    style: GoogleFonts.charmonman(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Chip(
                                      backgroundColor: AppColor.primary,
                                      label: Text(
                                        '8 oz',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                            fontSize: 14.sp
                                          ),
                                        ),
                                      ),
                                      Chip(
                                        backgroundColor: AppColor.primary,
                                        label: Text(
                                          '8 oz',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 14.sp
                                          ),
                                        ),
                                      ),
                                      ],
                                    ),
                                    const Spacer(),
                                    PrimaryButton(
                                      onPressed: (){},
                                      title: 'Add to Cart',
                                    )
                                ],
                              );
                            }
                            return const SizedBox();
                          }
                        ),
                    ),
                  );
                  cards.add(customizableCard);
                }
                return Stack(children: cards);
              },
            ),
          ),
          Positioned.fill(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 10,
              controller: pageController,
              itemBuilder: (context, index) {
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}