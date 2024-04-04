import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color2.dart';

class GenericCircleAvatar extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color? color;

  const GenericCircleAvatar(
      {super.key, required this.child, required this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          color: color ?? blackColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(child: child),
      ),
    );
  }
}
