import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Models/user_order_model.dart';

final bookedRepo = Provider((ref) {
  return BookedRepo(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  );
});

class BookedRepo {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  BookedRepo({required this.firestore, required this.auth});

  Future<List<UsersOrderModel>> fetchBookedDriver() async {
    List<UsersOrderModel> bookedDrivers = [];

    final snapshots = await firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
        .collection("orders")
        .get();

    for (var doc in snapshots.docs) {
      final orderData = doc.data();

      UsersOrderModel driver = UsersOrderModel.fromMap(orderData);

      bookedDrivers.add(driver);
    }

    return bookedDrivers;
  }
}
