import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Theme/fontsize.dart';
import 'package:trucks/Common/Theme/fontweight.dart';
import 'package:trucks/Features/Auth/widgets/generic_text.dart';

class GenericTextButton extends StatelessWidget {
  final void Function() onTap;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String title;

  const GenericTextButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.fontSize,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GenericText(
        color: color ?? greenColor,
        fontSize: fontSize ?? fontSize2half,
        fontWeight: fontWeight ?? fontWeight7,
        text: title,
      ),
    );
  }
}
