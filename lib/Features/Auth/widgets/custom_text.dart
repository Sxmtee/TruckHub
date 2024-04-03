import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trucks/Common/Utils/dimension.dart';

Text customTextPoppinsCenter({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    textAlign: TextAlign.center,
    style: GoogleFonts.poppins(
      fontSize: getProportionateScreenWidth(fontSize),
      fontWeight: weight,
      color: colorName,
    ),
  );
}

Text customTextNotoSans({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    style: GoogleFonts.notoSans(
      fontSize: getProportionateScreenWidth(fontSize),
      fontWeight: weight,
      color: colorName,
    ),
  );
}

Text customTextPppinsSpacing({
  required String inputText,
  required double height,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    style: GoogleFonts.notoSans(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        height: height,
        color: colorName),
  );
}

Text customTextPoppinsTextRich({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: inputText,
          style: GoogleFonts.poppins(
            fontSize: getProportionateScreenWidth(fontSize),
            fontWeight: weight,
            color: colorName,
          ),
        )
      ],
    ),
  );
}
