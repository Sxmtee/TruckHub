// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Features/Auth/screens/onboarding_screen.dart';
import 'package:trucks/Features/Auth/widgets/generic_circle.dart';
import 'package:trucks/Features/Auth/widgets/generic_region.dart';
import 'package:trucks/Screens/driver_screen.dart';
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

        var driverData = await FirebaseFirestore.instance
            .collection("drivers")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get();

        if (userData.data() != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            MobileScreen.routeName,
            (route) => false,
          );
        } else if (driverData.data() != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            DriverScreen.routeName,
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GenericAnnotatedRegion(
      child: Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundPng),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: GenericCircleAvatar(
              radius: 300,
              child: Image.asset(truckHubLogoPng),
            ),
          ),
        ),
      ),
    );
  }
}
