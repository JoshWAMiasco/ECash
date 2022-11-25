import 'package:ecash/models/order_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderResponce{
  bool? failure;
  String? message;
  List<OrderModel>? orders;
  OrderModel? order;

  OrderResponce({
    this.failure = true,
    this.message = '',
    this.order,
    this.orders,
  });
}