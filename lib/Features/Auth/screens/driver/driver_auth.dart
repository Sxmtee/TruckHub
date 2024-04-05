import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Features/Auth/screens/driver/driver_login.dart';
import 'package:trucks/Features/Auth/screens/driver/driver_sign_up.dart';

class DriverAuth extends StatefulWidget {
  static const routeName = "/Driver-Auth";
  const DriverAuth({super.key});

  @override
  State<DriverAuth> createState() => _DriverAuthState();
}

class _DriverAuthState extends State<DriverAuth> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackColor,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DriverSignUp(next: goToNextPage),
          DriverLogin(back: goToPreviousPage),
        ],
      ),
    );
  }
}
