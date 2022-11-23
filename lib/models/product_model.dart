import 'package:ecash/models/variant_model.dart';

class ProductModel {
  String? uid;
  String? name;
  String? category;
  double? basePrice;
  String? photo;
  bool? isAvailable;
  List<VariantModel>? variants;

  ProductModel({this.uid, this.name, this.category, this.basePrice, this.photo, this.isAvailable, this.variants});

  ProductModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? '';
    name = json['name'] ?? '';
    category = json['category'] ?? '';
    basePrice = (json['basePrice'] ?? 0.0).toDouble();
    photo = json['photo'];
    isAvailable = json['isAvailable'] ?? false;
    if (json['variantModel'] != null) {
      variants = <VariantModel>[];
      json['variantModel'].forEach((v) {
        variants!.add(VariantModel.fromJson(v));
      });
    } else {
      variants = <VariantModel>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['category'] = category;
    data['basePrice'] = basePrice;
    data['photo'] = photo;
    if (variants != null) {
      data['variantModel'] = variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
