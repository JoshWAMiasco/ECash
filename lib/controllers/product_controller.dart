import 'dart:async';

import 'package:ecash/constants/app_utils.dart';
import 'package:ecash/models/cart_item_model.dart';
import 'package:ecash/models/order_model.dart';
import 'package:ecash/models/product_model.dart';
import 'package:ecash/repository/cart_repository.dart';
import 'package:ecash/repository/cart_responce.dart';
import 'package:ecash/repository/order_repository.dart';
import 'package:ecash/repository/product_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class ProductController extends ChangeNotifier {
  AsyncValue<List<ProductModel>> products = const AsyncValue.data(<ProductModel>[]);
  AsyncValue<List<CartItemModel>> cart = const AsyncValue.data(<CartItemModel>[]);
  AsyncValue<List<OrderModel>> orders = const AsyncValue.data(<OrderModel>[]);
  final _productRepository = ProductRepository();
  final _cartRepository = CartRepository();
  final _orderRepository = OrderRepository();
  double totalPriceCart = 0.0;

  StreamSubscription? _cartStream;
  StreamSubscription? _orderStream;

  
  

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
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null){
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
      if(item.isChecked!){
        total += item.variantSelected!.price! * item.quantity!;
      }
    }
    totalPriceCart = total;
    notifyListeners();
  }

  List<CartItemModel> getOrder() {
    var orders = <CartItemModel>[];
    for(var item in cart.value!){
      if(item.isChecked!){
        orders.add(item);
      }
    }
    return orders;
  }


  void addListenerToCart() {
    _cartStream = _cartRepository.addListner().listen((res) {
      if(res.failure == false) {  
        List<CartItemModel> updatedCartList = cart.value!;
        for(var newItem in res.lisOfItem!){
          List<String> cartIds = <String>[];
          for(var userItem in cart.value!){
            cartIds.add(userItem.id!);
          }
          if(newItem.docType == 'added' && cartIds.contains(newItem.id) == false){
            updatedCartList.add(newItem);
          } else if(newItem.docType == 'modified') {
            int index = 0;
            for(var userItem in cart.value!){
              if(newItem.id == userItem.id) {
                updatedCartList[index] = newItem;
              }
              index++;
            }
          } else if(newItem.docType == 'removed') {
            int index = 0;
            for(var userItem in cart.value!){
              if(newItem.id == userItem.id) {
                updatedCartList.removeAt(index);
              }
              index++;
            }
          }
        }
        cart = AsyncValue.data(updatedCartList);
        notifyListeners();
      }
    });
  }

  void addListenerToOrder() {
    _orderStream = _orderRepository.addListner().listen((res) {
      if(res.failure == false) {
        List<OrderModel> updatedOrderList = orders.value!;
        for(var newOrder in res.orders!){
          List<String> orderIds = <String>[];
          for(var userOrder in orders.value!){
            orderIds.add(userOrder.uid!);
          }
          if(newOrder.docType == 'added' && orderIds.contains(newOrder.uid) == false){
            updatedOrderList.add(newOrder);
          } else if(newOrder.docType == 'modified') {
            int index = 0;
            for(var userOrder in orders.value!){
              if(newOrder.uid == userOrder.uid) {
                updatedOrderList[index] = newOrder;
              }
              index++;
            }
          } else if(newOrder.docType == 'removed') {
            int index = 0;
            for(var userOrder in orders.value!){
              if(newOrder.uid == userOrder.uid) {
                updatedOrderList.removeAt(index);
              }
              index++;
            }
          }
        }
        orders = AsyncValue.data(updatedOrderList);
        notifyListeners();
      }
    });
  }

  void clearCart() {
    cart = const AsyncValue.data(<CartItemModel>[]);
    _cartStream?.cancel();
  }

  String generateOrderNumber() {
    if(AppUtils.isAm()){
      return "AM${const Uuid().v4().substring(0,4)}";
    } else {
      return "PM${const Uuid().v4().substring(0,4)}";
    }
  }

  Future<CartResponce> addOrder(OrderModel order) async {
    return await _cartRepository.addOrder(order);
  }

  Future<void> getMyOrder() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    orders = const AsyncValue.loading();
    notifyListeners();
    if(currentUser != null){
      await _orderRepository.getMyOrders().then((res){
        if(res.failure == false){
          orders = AsyncValue.data(res.orders!);
          notifyListeners();
        } else {
          orders = AsyncValue.error(res.message!, StackTrace.current);
          notifyListeners();
        }
      });
    }
  }


}
