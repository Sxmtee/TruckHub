import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.child,
    required this.borderRadius,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final Widget child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

class CircleContainer2 extends StatelessWidget {
  const CircleContainer2({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.child,
    required this.borderRadius,
    this.borderColor,
    this.borderWidth = 0.0,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final Widget child;
  final double borderRadius;
  final Color? borderColor; // Optional border color
  final double borderWidth; // Optional border width

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
