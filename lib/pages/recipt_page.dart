import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/multi_clipper.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_utils.dart';
import 'package:ecash/constants/image.dart';
import 'package:ecash/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReciptPage extends StatelessWidget {
  const ReciptPage({Key? key, required this.order}) : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  height: 25.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColor.ligthBlue,
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    const Image(
                      image: AssetImage(
                        appLogo,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ClipPath(
                      clipper: MultiplePointsClipper(
                        Sides.vertical,
                        heightOfPoint: 12.8.sp,
                        numberOfPoints: 18,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        color: AppColor.secondary,
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order#: ${order.orderNumber!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary,
                                    fontSize: 17.sp,
                                  ),
                                ),
                                Chip(
                                  label: Text(
                                    AppUtils.getOrderStatus(order.status!),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Date: January 2, 2022 - 3:00PM',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DottedLine(
                              lineLength: double.infinity,
                              dashColor: Colors.grey.shade500,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(order.items!.length, (index){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                    flex: 6,
                                    child: Text(
                                      order.items![index].product!.name! + order.items![index].variantSelected!.name!,

                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        '${order.items![index].quantity!}x',
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Text(
                                        '₱ ${order.items![index].variantSelected!.price!}',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    ],
                                  );
                              }),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DottedLine(
                              lineLength: double.infinity,
                              dashColor: Colors.grey.shade500,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary,
                                    fontSize: 17.sp,
                                  ),
                                ),
                                Text(
                                  '₱ ${order.totalPrice!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.green,
                                    fontSize: 17.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DottedLine(
                              lineLength: double.infinity,
                              dashColor: Colors.grey.shade500,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Paalala :',
                                  style: TextStyle(
                                    color: AppColor.red,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  'Maari lamang na bayaran muna bago namin gawin ang order.Salamat ! : )',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DottedLine(
                              lineLength: double.infinity,
                              dashColor: Colors.grey.shade500,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'You Can pay via Gcash/Maya App just transfer the exact amount to this account. and upload the screenshot of the receipt.',
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Or pay over the counter just visit our store at Phase 2 Blk 5 lot 4. and present this reciept',
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.sp,
                        right: 20.sp,
                      ),
                      child: Column(
                        children: [
                          PrimaryButton(
                            title: 'Upload Proof of payment',
                            onPressed: () {
                              messageDialog(context, content: 'Hello');
                            },
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          PrimaryButton(
                            title: 'Close',
                            onPressed: () => context.router.pop(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
