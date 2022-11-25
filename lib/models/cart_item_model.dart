import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/product_model.dart';
import 'package:ecash/models/variant_model.dart';

class CartItemModel {
  ProductModel? product;
  VariantModel? variantSelected;
  int? quantity;
  DateTime? dateAdded;
  bool? isChecked;
  String? id;
  String? docType;

  CartItemModel({
    this.product,
    this.variantSelected,
    this.quantity,
    this.dateAdded,
    this.id = '',
    this.docType = '',
  });

  CartItemModel.fromJson(String uid, Map<String, dynamic> json) {
    product = ProductModel.fromJson(json['product'] ?? {});
    variantSelected = VariantModel.fromJson(json['variantSelected'] ?? {});
    quantity = json['quantity'] ?? 0;
    dateAdded = json['dateAdded'] != null ? (json['dateAdded'] as Timestamp).toDate() : null;
    isChecked = json['isChecked'] ?? false;
    id = uid;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product'] = product!.toJson();
    data['variantSelected'] = variantSelected!.toJson();
    data['quantity'] = quantity;
    data['dateAdded'] = dateAdded;
    data['isChecked'] = isChecked;
    return data;
  }
}
