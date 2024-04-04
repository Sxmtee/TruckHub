import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Theme/fontsize.dart';
import 'package:trucks/Common/Theme/fontweight.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Features/Auth/screens/driver_auth.dart';
import 'package:trucks/Features/Auth/screens/user_auth.dart';
import 'package:trucks/Features/Auth/widgets/generic_elevated.dart';
import 'package:trucks/Features/Auth/widgets/generic_region.dart';
import 'package:trucks/Features/Auth/widgets/generic_text.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/Onboarding-screen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  late ValueNotifier<int> valueNotifier;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    valueNotifier = ValueNotifier<int>(0);
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (pageController.page == 2.0) {
        pageController.animateToPage(
          0,
          duration: const Duration(seconds: 2),
          curve: Curves.decelerate,
        );
      } else {
        pageController.nextPage(
          duration: const Duration(seconds: 2),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GenericAnnotatedRegion(
      changeStatusBarIconBrightness: true,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Center(
                    child: PageView(
                      onPageChanged: (pageIndex) =>
                          valueNotifier.value = pageIndex,
                      controller: pageController,
                      children: [
                        Image.asset(personPng, fit: BoxFit.cover),
                        Image.asset(driverPng, fit: BoxFit.cover),
                        Image.asset(phoneMapPng, fit: BoxFit.cover)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const GenericText(
                            noCenterAlign: true,
                            color: whiteColor,
                            fontSize: fontSize3,
                            fontWeight: fontWeight5,
                            text: introString,
                          ),
                          const GenericText(
                            noCenterAlign: true,
                            color: whiteColor,
                            fontSize: fontSize3,
                            fontWeight: fontWeight5,
                            text: introString2,
                          ),
                          const Gap(10),
                          ValueListenableBuilder(
                            valueListenable: valueNotifier,
                            builder: (_, value, __) {
                              return DotsIndicator(
                                position: value,
                                dotsCount: 3,
                                decorator: DotsDecorator(
                                  activeColor: whiteColor,
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  activeSize: const Size(20, 8),
                                  color: blackColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                      color: whiteColor.withAlpha(200),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomSheet(
                constraints: BoxConstraints(
                  maxHeight: screenHeight * 0.3,
                  maxWidth: screenWidth,
                ),
                elevation: 0,
                onClosing: () {},
                builder: (context) {
                  return SizedBox(
                    width: screenWidth,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Gap(30),
                          GenericElevatedButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              UserAuth.routeName,
                            ),
                            title: findAtruckString,
                          ),
                          const Gap(15),
                          GenericElevatedButton(
                            backgroundColor: whiteColor,
                            color: blackColor,
                            onPressed: () => Navigator.of(context).pushNamed(
                              DriverAuth.routeName,
                            ),
                            title: earnAsDriverString,
                          ),
                          const Gap(90)
                        ],
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
