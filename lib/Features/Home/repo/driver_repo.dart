// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:trucks/Models/drivermodel.dart';
import 'package:trucks/Models/usermodel.dart';

final driverRepo = Provider((ref) {
  return DriverRepo(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  );
});

class DriverRepo {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  DriverRepo({required this.firestore, required this.auth});

  Future<List<DriverModel>> fetchDrivers(BuildContext context) async {
    List<DriverModel> drivers = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('drivers').get();
      for (var doc in snapshot.docs) {
        final user = UserModel.fromMap(doc.data());

        drivers.add(
          DriverModel(
            name: user.name,
            phoneNumber: user.phoneNumber,
            profilePic: user.profilePic,
            uid: user.uid,
            email: user.email,
          ),
        );
      }
    } catch (e) {
      showSnackBar(context, "No available driver");
    }
    return drivers;
  }
}
