import 'package:flutter/material.dart';
import 'package:trucks/Common/Extensions/text_extensions.dart';
import 'package:trucks/Common/Theme/color2.dart';

class GenericText extends StatelessWidget {
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;
  final bool? noCenterAlign, controlOverflow;

  const GenericText({
    super.key,
    this.color,
    this.noCenterAlign,
    this.controlOverflow,
    required this.fontSize,
    required this.fontWeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text).decorateText(
      controlOverflow: controlOverflow,
      noCenterAlign: noCenterAlign,
      color: color ?? blackColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
