import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/cart_card.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/no_cart_placeholder.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/models/cart_item_model.dart';
import 'package:ecash/models/order_model.dart';
import 'package:ecash/pages/recipt_page.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getData());
  }

  void getData() async {
    await ref.read(productProvider).getCartItems().whenComplete(() {
      ref.read(productProvider).computeTotalPriceOnCart();
    });
    ref.read(productProvider).addListenerToCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 17.sp, right: 17.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  ref.watch(productProvider).cart.when(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    data: (cartList) {
                      return Column(
                        children: List.generate(
                          cartList.length,
                          (index) => CartCard(
                            initialChecked: cartList[index].isChecked!,
                            onChange: (value) async {
                              CartItemModel updatedItem = cartList[index];
                              updatedItem.isChecked = value;
                              ref.read(productProvider).update(updatedItem).then((res){
                                if(res.failure == false){
                                  ref.read(productProvider).computeTotalPriceOnCart();
                                  log('check');
                                } else {
                                  log('error');
                                }
                              });
                            },
                            onIncrement: () {
                              CartItemModel updatedItem = cartList[index];
                              if(updatedItem.quantity! < 50){
                                updatedItem.quantity = updatedItem.quantity! + 1;
                                ref.read(productProvider).update(updatedItem).then((res){
                                  if(res.failure == false){
                                    log('check');
                                    ref.read(productProvider).computeTotalPriceOnCart();
                                  } else {
                                    log('error');
                                  }
                                });
                              } else {
                                messageDialog(context, content: 'you\'ve reach the maximum order per item');
                              }
                              
                            },
                            onDecrease: () {
                              CartItemModel updatedItem = cartList[index];
                              if(updatedItem.quantity! > 0 ){
                                updatedItem.quantity = updatedItem.quantity! - 1;
                                ref.read(productProvider).update(updatedItem).then((res){
                                  if(res.failure == false){
                                    log('check');
                                    ref.read(productProvider).computeTotalPriceOnCart();
                                  } else {
                                    log('error');
                                  }
                                });
                              } else {
                                messageDialog(context, content: 'you\'ve reach the minimum order per item');
                              }
                            },
                            cartItem: cartList[index],
                          ),
                        ),
                      );
                    },
                    error: (error, stact) {
                      return const NoCartPlaceHolder();
                    },
                  ),
                  //NoCartPlaceHolder(),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: ref.watch(authProvider).user != null && ref.watch(productProvider).cart.hasValue,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30.sp,
                width: 90.w,
                margin: EdgeInsets.only(
                  bottom: 3.h,
                ),
                padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 10.sp, 10.sp),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: AppColor.secondary,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          '₱ ${ref.watch(productProvider).totalPriceCart.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        OrderModel newOrder = OrderModel(
                          dateOrder: DateTime.now(),
                          items: ref.read(productProvider).getOrder(),
                          totalPrice: ref.read(productProvider).totalPriceCart,
                          orderNumber: ref.read(productProvider).generateOrderNumber(),
                          status: OrderStatus.toPay.name,
                          userId: ref.read(authProvider).getUserId(),
                        );
                        loadingIndicator(context);
                        await ref.read(productProvider).addOrder(newOrder).then((res){
                          if(res.failure == false){
                            Navigator.of(context, rootNavigator: true).pop();
                            messageDialog(context, content: 'Order Successfuly Submit!, Thank you!');
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ReciptPage(
                              order: newOrder,
                            )));
                          } else {
                            Navigator.of(context, rootNavigator: true).pop();
                            messageDialog(context, content: res.message);
                          }
                        });
                        
                      },
                      child: Container(
                        height: 28.sp,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.sp, 5.h, 20.sp, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Container(
                      height: 5.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.sp),
                          bottomRight: Radius.circular(15.sp),
                        ),
                        color: AppColor.primary,
                      ),
                      padding: EdgeInsets.all(10.sp),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Cart',
                    style: GoogleFonts.charmonman(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                      fontSize: 22.sp,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
