import 'package:ecash/models/product_model.dart';

class ProductResponce {
  bool failure;
  ProductModel? product;
  List<ProductModel>? listOfProduct;
  String message;
  String uid;

  ProductResponce({
    this.failure = true,
    this.uid = '',
    this.product,
    this.message = '',
    this.listOfProduct,
  });
}
