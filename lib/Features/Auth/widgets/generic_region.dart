import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trucks/Common/Theme/color2.dart';

class GenericAnnotatedRegion extends StatelessWidget {
  final Widget child;
  final bool? changeStatusBarIconBrightness;

  const GenericAnnotatedRegion({
    super.key,
    required this.child,
    this.changeStatusBarIconBrightness,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: blackColor,
        statusBarColor: transparentColor,
        statusBarIconBrightness: changeStatusBarIconBrightness ?? false
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}
