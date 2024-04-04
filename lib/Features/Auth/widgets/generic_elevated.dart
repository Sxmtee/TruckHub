import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Theme/fontsize.dart';
import 'package:trucks/Common/Theme/fontweight.dart';
import 'package:trucks/Features/Auth/widgets/generic_text.dart';

class GenericElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color? color, backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? noMargin;

  const GenericElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.noMargin,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width,
      height: 50,
      margin:
          noMargin ?? false ? null : const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(backgroundColor ?? blackColor),
          side: const MaterialStatePropertyAll(
            BorderSide(
              width: 1,
              strokeAlign: 1,
              color: blackColor,
            ),
          ),
        ),
        child: GenericText(
          color: color ?? whiteColor,
          fontSize: fontSize ?? fontSize3,
          fontWeight: fontWeight ?? fontWeight5,
          text: title,
        ),
      ),
    );
  }
}
