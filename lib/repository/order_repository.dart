import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/models/order_model.dart';
import 'package:ecash/repository/order_responce.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderRepository {

  Future<OrderResponce> getMyOrders() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    try {
      return await FirebaseFirestore.instance.collection('Orders')
            .where('userId', isEqualTo: currentUser!.uid)
            .where('status', isNotEqualTo: 'close').get().then((query) {
              if(query.docs.isNotEmpty){
                List<OrderModel> orders = <OrderModel>[];
                for(var doc in query.docs){
                  orders.add(OrderModel.fromJson(doc.id, doc.data()));
                }
                return OrderResponce(
                  failure: false,
                  orders: orders,
                );
              } else {
                return OrderResponce(
                  failure: true,
                  message: 'empty',
                );
              }
            });
    } on FirebaseException catch (e) {
      return OrderResponce(
        failure: true,
        message: e.message!
      );
    }
  } 

  Stream<OrderResponce> addListner() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance.collection('Orders')
            .where('userId', isEqualTo: currentUser!.uid)
            .where('status', isNotEqualTo: 'close').snapshots().map((query) {
      if(query.docChanges.isNotEmpty) {
        List<OrderModel> orders = <OrderModel>[];
        for(var doc in query.docChanges){
          OrderModel order = OrderModel.fromJson(doc.doc.id, doc.doc.data()!);
          switch (doc.type) {
            case DocumentChangeType.added:
              order.docType = 'added';
              break;
            case DocumentChangeType.modified:

              order.docType = 'modified';
              break;
            case DocumentChangeType.removed:
              order.docType = 'removed';
              break;
            default:
          }
          orders.add(order);
        }
        return OrderResponce(
          failure: false,
          orders: orders
        );
      } else {
        return OrderResponce(
          failure: true,
          message: 'empty'
        );
      }
      
    });
  }
}