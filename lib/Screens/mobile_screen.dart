import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Features/Account/screens/accountscreen.dart';
import 'package:trucks/Features/Booked/screens/bookedscreen.dart';
import 'package:trucks/Features/Home/screens/homescreen.dart';

class MobileScreen extends StatefulWidget {
  static const routeName = "/Mobile-screen";
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Booked(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        activeColor: Colors.green,
        inactiveColor: AppColors.blackColor,
        elevation: 20,
        shadow: Shadow(color: AppColors.blackColor),
        leftCornerRadius: 25,
        rightCornerRadius: 25,
        splashColor: AppColors.primaryColor,
        splashSpeedInMilliseconds: 500,
        gapLocation: GapLocation.none,
        icons: const [
          Icons.home,
          Icons.bookmark,
          Icons.person_outline,
        ],
      ),
    );
  }
}
