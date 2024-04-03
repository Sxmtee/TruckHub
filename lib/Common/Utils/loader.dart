import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trucks/Common/Theme/color.dart';

class Loader extends StatelessWidget {
  final double radius;
  final Color? color;
  const Loader({
    super.key,
    this.radius = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        color: AppColors.primaryColor,
        size: radius,
      ),
    );
  }
}
