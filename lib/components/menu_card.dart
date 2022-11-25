import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/models/cart_item_model.dart';
import 'package:ecash/models/product_model.dart';
import 'package:ecash/models/variant_model.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuCard extends ConsumerStatefulWidget {
  const MenuCard({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  ConsumerState<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends ConsumerState<MenuCard> {
  VariantModel? selectedVariant;

  void setVariant(VariantModel variant) {
    if (selectedVariant != null) {
      if (selectedVariant!.name == variant.name) {
        setState(() {
          selectedVariant = null;
        });
      }
    } else {
      setState(() {
        selectedVariant = variant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      height: 44.sp,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.sp),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            padding: EdgeInsets.fromLTRB(32.w, 0, 10.sp, 10.sp),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(widget.product.variants!.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setVariant(widget.product.variants![index]);
                              },
                              child: Chip(
                                backgroundColor: widget.product.variants![index].name == selectedVariant?.name ? AppColor.primary : Colors.grey,
                                visualDensity: VisualDensity.compact,
                                label: Text(
                                  widget.product.variants![index].name ?? '',
                                  style: TextStyle(
                                    fontWeight: widget.product.variants![index].name == selectedVariant?.name ? FontWeight.bold : FontWeight.normal,
                                    color: widget.product.variants![index].name == selectedVariant?.name ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        Text(
                          '₱ ${widget.product.basePrice}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: CachedNetworkImage(
                  imageUrl: widget.product.photo!,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 40.sp,
                      width: 40.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: AppColor.primary,
                            width: 5.sp,
                          )),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.sp, top: 20.sp),
                child: SizedBox(
                  width: 60.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: AppColor.primary,
                        ),
                      ),
                      selectedVariant != null
                          ? InkWell(
                              onTap: () async {
                                if (ref.read(authProvider).user == null) {
                                  messageDialog(context, content: 'Please login before add to cart');
                                } else {
                                  CartItemModel item = CartItemModel(
                                    dateAdded: DateTime.now(),
                                    product: widget.product,
                                    quantity: 1,
                                    variantSelected: selectedVariant,
                                  );
                                  loadingIndicator(context);
                                  await ref.read(productProvider).addToCart(item).then((res) {
                                    if (res.failure == false) {
                                      Navigator.of(context, rootNavigator: true).pop();
                                      messageDialog(context, content: 'Successfuly added to cart!');
                                    } else {
                                      Navigator.of(context, rootNavigator: true).pop();
                                      messageDialog(context, content: res.message);
                                    }
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primary,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
