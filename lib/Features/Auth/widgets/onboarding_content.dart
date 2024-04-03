import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Common/Utils/spacing.dart';
import 'package:trucks/Common/Utils/string.dart';
import 'package:trucks/Features/Auth/screens/sign_up.dart';
import 'package:trucks/Features/Auth/widgets/circle_containers.dart';
import 'package:trucks/Features/Auth/widgets/custom_text.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({
    Key? key,
    this.title,
    this.image,
    this.contentWidget,
    required this.currentIndex,
  }) : super(key: key);
  final String? title, image;
  final int? currentIndex;
  final Widget? contentWidget;

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              widget.image!,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
            Positioned(
              top: getProportionateScreenHeight(432),
              left: 27,
              right: 27,
              child: customTextPppinsSpacing(
                colorName: AppColors.greyColor,
                weight: FontWeight.w600,
                fontSize: 16,
                height: 24 / 16,
                inputText: widget.title!,
              ),
            ),
            Positioned(
              top: getProportionateScreenHeight(560),
              left: 27,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.contentWidget ?? const SizedBox(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(41),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, SignUp.routeName);
          },
          child: CircleContainer(
            height: 56,
            width: 232,
            color: AppColors.blackColor,
            borderRadius: 48,
            child: Center(
              child: customTextPppinsSpacing(
                colorName: AppColors.primaryColor,
                weight: FontWeight.w600,
                fontSize: 16,
                height: 24 / 16,
                inputText: StaticText.find,
              ),
            ),
          ),
        ),
        SpacingManager.h17,
        CircleContainer2(
          borderWidth: 1,
          height: 56,
          borderColor: AppColors.blackColor,
          width: 232,
          color: AppColors.primaryColor,
          borderRadius: 48,
          child: Center(
            child: customTextPppinsSpacing(
              colorName: AppColors.blackColor,
              weight: FontWeight.w600,
              fontSize: 16,
              height: 24 / 16,
              inputText: StaticText.earn,
            ),
          ),
        )
      ],
    );
  }
}
