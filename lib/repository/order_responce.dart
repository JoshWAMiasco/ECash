import 'package:ecash/models/order_model.dart';

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