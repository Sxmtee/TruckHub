import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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
    try {
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
    } catch (e) {
      if (kDebugMode) {
        print("ERROR: ${e.toString()}");
      }
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchBookedUser() async {
    try {
      List<Map<String, dynamic>> bookedUser = [];

      final snapshots = await firestore
          .collection("drivers")
          .doc(auth.currentUser?.uid)
          .collection("orders")
          .get();

      for (var doc in snapshots.docs) {
        final orderData = doc.data();

        final driver = {
          "uid": orderData["uid"],
          "user_name": orderData["user_name"],
          "phone_number": orderData["phone_number"],
        };

        bookedUser.add(driver);
      }

      return bookedUser;
    } catch (e) {
      if (kDebugMode) {
        print("ERROR: ${e.toString()}");
      }
      return [];
    }
  }

  Stream<UsersOrderModel> userData(String userId) {
    return firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
        .collection("orders")
        .doc(userId)
        .snapshots()
        .map(
          (event) => UsersOrderModel.fromMap(event.data()!),
        );
  }

  void setUserState(String uid) async {
    await firestore
        .collection("users")
        .doc(uid)
        .collection("orders")
        .doc(auth.currentUser?.uid)
        .update({
      "isAccepted": true,
    });
  }
}
