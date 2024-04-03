// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:trucks/Features/Auth/screens/onboarding_screen.dart';
import 'package:trucks/Models/user.preferences.dart';
import 'package:trucks/Models/usermodel.dart';
import 'package:trucks/Screens/mobile_screen.dart';

final authRepo = Provider(
  (ref) => AuthRepo(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepo({required this.auth, required this.firestore});

  void signUserIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final id = userCredential.user!.uid;
      await firestore.collection("users").doc(id).get();

      Navigator.pushNamedAndRemoveUntil(
        context,
        MobileScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signUserUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final id = userCredential.user!.uid;

      final userDetails = {
        "user_id": id,
        "name": name,
        "email": email,
        "password": password,
      };

      await firestore.collection("users").doc(id).set(userDetails);

      Navigator.pushNamedAndRemoveUntil(
        context,
        MobileScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection("users").doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signOut(BuildContext context) async {
    await auth.signOut();
    await TruckPreferences.clear();
    Navigator.pushNamedAndRemoveUntil(
      context,
      OnboardingScreen.routeName,
      (route) => false,
    );
  }
}
