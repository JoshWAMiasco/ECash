import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/models/cart_item_model.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartCard extends ConsumerStatefulWidget {
  const CartCard({this.onChange,Key? key, this.cartItem, required this.initialChecked, this.onIncrement, this.onDecrease}) : super(key: key);
  final CartItemModel? cartItem;
  final Function(bool?)? onChange;
  final bool initialChecked;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrease;

  @override
  ConsumerState<CartCard> createState() => _CartCardState();
}

class _CartCardState extends ConsumerState<CartCard> {

  bool selected = true;

  @override
  void initState() {
    super.initState();
    selected = widget.initialChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      height: 43.sp,
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
            padding: EdgeInsets.fromLTRB(32.w, 10.sp, 10.sp, 10.sp),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartItem!.variantSelected!.name!,
                    ),
                    Text(
                      'Price: ₱ ${widget.cartItem!.variantSelected!.price!}',
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 10.sp,
                ),
                Text(
                  '₱ ${widget.cartItem!.variantSelected!.price! * widget.cartItem!.quantity!}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                    fontSize: 18.sp,
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.cartItem!.product!.photo!,
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
                    Positioned(
                      bottom: 1.sp,
                      left: 2.sp,
                      child: Container(
                        height: 20.sp,
                        width: 20.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primary,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          widget.cartItem!.quantity.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.sp, top: 20.sp),
                child: Text(
                  widget.cartItem!.product!.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColor.primary,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 10.sp, top: 20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: widget.onDecrease,
                      child: CircleAvatar(
                        radius: 14.sp,
                        backgroundColor: Colors.grey.shade600,
                        child: Icon(
                          Icons.remove,
                          size: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    InkWell(
                      onTap: widget.onIncrement,
                      child: CircleAvatar(
                        radius: 14.sp,
                        backgroundColor: AppColor.primary,
                        child: Icon(
                          Icons.add,
                          size: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Checkbox(
            value: selected,
            onChanged: (value) {
              setState(() {
                selected = !selected;
              });
              widget.onChange!(selected);
            },
            activeColor: AppColor.primary,
            checkColor: Colors.white,
            side: BorderSide(color: AppColor.primary, width: 7.sp),
          ),
        ],
      ),
    );
  }
}
