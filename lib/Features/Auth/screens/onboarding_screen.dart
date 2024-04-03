import 'package:flutter/material.dart';
import 'package:trucks/Common/Utils/assets_location.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Common/Utils/string.dart';
import 'package:trucks/Features/Auth/widgets/build_dot.dart';
import 'package:trucks/Features/Auth/widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/Onboarding-screen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(
              physics:
                  const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) => OnboardingContent(
                image: Assets.pics[index]["image"],
                title: onBoardingData[index]["title"],
                currentIndex: index,
                contentWidget: Row(
                  children: List.generate(
                    onBoardingData.length,
                    (index) => BuildDot(
                      currentPage: currentPage,
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
