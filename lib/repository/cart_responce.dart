import 'package:ecash/models/cart_item_model.dart';

class CartResponce {
  bool failure;
  String message;
  String uid;
  List<CartItemModel>? lisOfItem;
  CartItemModel? cartItem;
  CartResponce({
    this.failure = true,
    this.message = "",
    this.uid = "",
    this.cartItem,
    this.lisOfItem,
  });
}
