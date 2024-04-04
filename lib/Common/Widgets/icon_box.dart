import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback? onPressed;
  final Color? color;
  final Icon icon;
  const IconBox({
    super.key,
    this.height = 60,
    this.width = 60,
    this.color,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
