// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:trucks/Models/usermodel.dart';

final accountRepo = Provider((ref) {
  return AccountRepo(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  );
});

class AccountRepo {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  AccountRepo({required this.firestore, required this.auth});

  Future<UserModel> fetchUserAccount() async {
    final data =
        await firestore.collection("users").doc(auth.currentUser?.uid).get();

    return UserModel.fromMap(data.data()!);
  }

  Future<void> updateUserDetails({
    required BuildContext context,
    required UserModel user,
  }) async {
    try {
      await firestore.collection("users").doc(auth.currentUser?.uid).update(
            user.toMap(),
          );
      showSnackBar(context, 'User details updated successfully');
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  Future<UserModel> fetchDriverAccount() async {
    final data =
        await firestore.collection("drivers").doc(auth.currentUser?.uid).get();

    return UserModel.fromMap(data.data()!);
  }

  Future<void> updateDriverDetails({
    required BuildContext context,
    required UserModel user,
  }) async {
    try {
      await firestore.collection("drivers").doc(auth.currentUser?.uid).update(
            user.toMap(),
          );
      showSnackBar(context, 'Driver details updated successfully');
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }
}
