import 'package:ecash/models/cart_item_model.dart';
import 'package:ecash/models/product_model.dart';
import 'package:ecash/repository/cart_repository.dart';
import 'package:ecash/repository/cart_responce.dart';
import 'package:ecash/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductController extends ChangeNotifier {
  AsyncValue<List<ProductModel>> products = const AsyncValue.data(<ProductModel>[]);
  AsyncValue<List<CartItemModel>> cart = const AsyncValue.data(<CartItemModel>[]);
  final _productRepository = ProductRepository();
  final _cartRepository = CartRepository();
  double totalPriceCart = 0.0;

  Future<void> getProducts() async {
    products = const AsyncValue.loading();
    notifyListeners();
    final res = await _productRepository.getListOfProduct();
    if (res.failure == false) {
      products = AsyncValue.data(res.listOfProduct!);
      notifyListeners();
    } else {
      products = AsyncValue.error(res.message, StackTrace.current);
    }
  }

  Future<void> getCartItems() async {
    cart = const AsyncValue.loading();
    notifyListeners();
    final res = await _cartRepository.getMyCartItems();
    if (res.failure == false) {
      cart = AsyncValue.data(res.lisOfItem!);
      notifyListeners();
    } else {
      cart = AsyncValue.error(res.message, StackTrace.current);
      notifyListeners();
    }
  }

  Future<CartResponce> addToCart(CartItemModel cartItem) async {
    return await _cartRepository.addToCart(cartItem);
  }

  Future<CartResponce> update(CartItemModel cartItem, {String? message}) async {
    return await _cartRepository.update(cartItem, message: message);
  }

  void computeTotalPriceOnCart() {
    double total = 0.0;
    for(var item in cart.value!){
      total += item.variantSelected!.price!;
    }
    totalPriceCart = total;
    notifyListeners();
  }
}
