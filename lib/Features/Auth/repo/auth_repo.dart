// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:trucks/Features/Auth/screens/onboarding_screen.dart';
import 'package:trucks/Models/usermodel.dart';
import 'package:trucks/Screens/driver_screen.dart';
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

  void signDriverIn({
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
      await firestore.collection("drivers").doc(id).get();

      Navigator.pushNamedAndRemoveUntil(
        context,
        DriverScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signDriverUp({
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

      final userDetails = UserModel(
        name: name,
        phoneNumber: "",
        profilePic: "",
        uid: id,
        email: email,
        password: password,
      );

      await firestore.collection("drivers").doc(id).set(userDetails.toMap());

      Navigator.pushNamedAndRemoveUntil(
        context,
        DriverScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

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

      final userDetails = UserModel(
        name: name,
        phoneNumber: "",
        profilePic: "",
        uid: id,
        email: email,
        password: password,
      );

      await firestore.collection("users").doc(id).set(userDetails.toMap());

      Navigator.pushNamedAndRemoveUntil(
        context,
        MobileScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut(BuildContext context) async {
    Navigator.pop(context);
    await auth.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      OnboardingScreen.routeName,
      (route) => false,
    );
  }
}
