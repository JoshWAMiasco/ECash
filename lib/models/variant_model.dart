class VariantModel {
  String? name;
  double? price;
  String? photo;

  VariantModel({this.name, this.price, this.photo});

  VariantModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    price = (json['price'] ?? 0.0).toDouble();
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['photo'] = photo;
    return data;
  }
}
