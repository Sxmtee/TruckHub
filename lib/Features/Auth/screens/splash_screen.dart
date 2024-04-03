// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Theme/color.dart';
import 'package:trucks/Common/Utils/assets_location.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Features/Auth/screens/onboarding_screen.dart';
import 'package:trucks/Features/Auth/widgets/circle_containers.dart';
import 'package:trucks/Screens/mobile_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () async {
        var userData = await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get();

        if (userData.data() != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            MobileScreen.routeName,
            (route) => false,
          );
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            OnboardingScreen.routeName,
            (route) => false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              Assets.back,
              width: getProportionateScreenWidth(390),
              height: getProportionateScreenHeight(844),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: getProportionateScreenWidth(45),
            right: getProportionateScreenWidth(45),
            top: getProportionateScreenHeight(264),
            child: CircleContainer(
              height: getProportionateScreenHeight(250),
              width: getProportionateScreenWidth(150),
              color: AppColors.blackColor,
              borderRadius: 300,
              child: Center(
                child: Image.asset(Assets.truck),
              ),
            ),
          )
        ],
      ),
    );
  }
}
