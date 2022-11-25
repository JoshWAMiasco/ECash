import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/product_model.dart';
import 'package:ecash/repository/product_responce.dart';

class ProductRepository {
  final productCollection = FirebaseFirestore.instance.collection('Products');

  Future<ProductResponce> getListOfProduct() async {
    try {
      var query = await productCollection.where('isAvailable', isEqualTo: true).get();
      if (query.docs.isNotEmpty) {
        List<ProductModel> products = <ProductModel>[];
        for (var doc in query.docs) { 
          products.add(ProductModel.fromJson(doc.data()));
        }
        return ProductResponce(
          failure: false,
          listOfProduct: products,
        );
      } else {
        return ProductResponce(failure: true, message: 'empty');
      }
    } on FirebaseException catch (e) {
      return ProductResponce(
        failure: true,
        message: e.message!,
      );
    }
  }
}
