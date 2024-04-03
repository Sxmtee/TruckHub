import 'package:flutter/material.dart';
import 'package:trucks/Common/Widgets/error_screen.dart';
import 'package:trucks/Common/Widgets/page_router.dart';
import 'package:trucks/Features/Auth/screens/login.dart';
import 'package:trucks/Features/Auth/screens/onboarding_screen.dart';
import 'package:trucks/Features/Auth/screens/sign_up.dart';
import 'package:trucks/Screens/mobile_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingScreen.routeName:
      return pageRouter(child: const OnboardingScreen());
    case SignUp.routeName:
      return pageRouter(child: const SignUp());
    case LoginPage.routeName:
      return pageRouter(child: const LoginPage());
    case MobileScreen.routeName:
      return pageRouter(child: const MobileScreen());
    default:
      return pageRouter(
        child: const Scaffold(
          body: ErrorScreen(
            error: "This Page Does Not Exist",
          ),
        ),
      );
  }
}
