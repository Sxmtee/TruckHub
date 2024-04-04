import 'package:flutter/material.dart';
import 'package:trucks/Common/Widgets/error_screen.dart';
import 'package:trucks/Common/Widgets/page_router.dart';
import 'package:trucks/Features/Account/screens/profile_screen.dart';
import 'package:trucks/Features/Auth/screens/driver_auth.dart';
import 'package:trucks/Features/Auth/screens/user_auth.dart';
import 'package:trucks/Features/Auth/screens/onboarding_screen.dart';
import 'package:trucks/Screens/driver_screen.dart';
import 'package:trucks/Screens/mobile_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingScreen.routeName:
      return pageRouter(child: const OnboardingScreen());
    case UserAuth.routeName:
      return pageRouter(child: const UserAuth());
    case DriverAuth.routeName:
      return pageRouter(child: const DriverAuth());
    case ProfileScreen.routeName:
      return pageRouter(child: const ProfileScreen());
    case MobileScreen.routeName:
      return pageRouter(child: const MobileScreen());
    case DriverScreen.routeName:
      return pageRouter(child: const DriverScreen());
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
