import 'package:flutter/material.dart';
import 'package:trucks/Common/Widgets/error_screen.dart';
import 'package:trucks/Common/Widgets/page_router.dart';
import 'package:trucks/Features/Account/screens/driver/d_profile.dart';
import 'package:trucks/Features/Account/screens/user/profile_screen.dart';
import 'package:trucks/Features/Auth/screens/driver/driver_auth.dart';
import 'package:trucks/Features/Auth/screens/user/user_auth.dart';
import 'package:trucks/Features/Auth/screens/onboarding_screen.dart';
import 'package:trucks/Features/Home/widgets/driver_profile.dart';
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
    case DProfileScreen.routeName:
      return pageRouter(child: const DProfileScreen());
    case MobileScreen.routeName:
      return pageRouter(child: const MobileScreen());
    case DriverScreen.routeName:
      return pageRouter(child: const DriverScreen());
    case DriverProfile.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final String profilePic = arguments["profilePic"];
      final String name = arguments["name"];
      final String phoneNumber = arguments["phoneNumber"];
      return pageRouter(
        child: DriverProfile(
          profilePic: profilePic,
          name: name,
          phoneNumber: phoneNumber,
        ),
      );
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
