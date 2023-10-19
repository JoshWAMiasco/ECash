
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/cart_item_model.dart';


class OrderModel {
  String? uid;
  String? orderNumber;
  DateTime? dateOrder;
  String? status;
  List<CartItemModel>? items;
  double? totalPrice;
  String? userId;
  String? docType;

  OrderModel({
    this.uid,
    this.orderNumber,
    this.dateOrder,
    this.status,
    this.items,
    this.totalPrice,
    this.userId,
    this.docType = '',
  });


  OrderModel.fromJson(String id, Map<String,dynamic> json) {
    uid = id;
    orderNumber = json['orderNumber'] ?? '';
    dateOrder = json['dateOrder'] != null ? (json['dateOrder'] as Timestamp).toDate() : null;
    if (json['items'] != null) {
      items = <CartItemModel>[];
      json['items'].forEach((v) {
        items!.add(CartItemModel.fromJson("", v));
      });
    } else {
      items = <CartItemModel>[];
    }
    status = json['status'] ?? '';
    totalPrice = (json['totalPrice'] ?? 0).toDouble();
  }

  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = {};
    data['orderNumber'] = orderNumber;
    data['dateOrder'] = dateOrder;
    data['status'] = status;
    data['totalPrice'] = totalPrice;
    data['userId'] = userId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}