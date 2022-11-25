import 'package:dotted_line/dotted_line.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_utils.dart';
import 'package:ecash/models/order_model.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderCard extends ConsumerWidget {
  const OrderCard({Key? key, required this.order}) : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,
      
      color: AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order#: ${order.orderNumber!}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Column(
                  children: [
                    Chip(
                      padding: EdgeInsets.zero,
                      label: Text(
                        AppUtils.getOrderStatus(order.status!),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: AppColor.secondary,
                    ),
                    Text(
                      '₱ ${order.totalPrice!.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    
                  ],
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            DottedLine(
              dashColor: Colors.white,
              lineLength: double.infinity,
              direction: Axis.horizontal,
              lineThickness: 2.sp,
              dashLength: 2.w,
            ),
            SizedBox(
              height: 1.h,
            ),
            Column(
              children: List.generate(order.items!.length, (index){
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20.sp,
                          width: 20.sp,
                          margin: EdgeInsets.only(right: 10.sp),
                          decoration: BoxDecoration(
                            color: AppColor.ligthBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              order.items![index].quantity!.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                            ),
                          ),
                        ),
                        Text(
                          order.items![index].product!.name! + order.items![index].variantSelected!.name!,
                          style: TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    )
                  ],
                );
              }),
            ),
            
          ],
        ),
      ),
    );
  }
}
