import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trucks/Common/Utils/string2.dart';

extension ModifyText on Text {
  Text decorateText({
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
    bool? controlOverflow,
    bool? noCenterAlign,
  }) =>
      Text(
        data ?? emptyString,
        style: GoogleFonts.getFont(
          nunitoFont,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
        overflow: controlOverflow ?? false ? TextOverflow.ellipsis : null,
        softWrap: true,
        textAlign: noCenterAlign ?? false ? null : TextAlign.center,
      );
}

extension DecorateTextStyle on TextStyle {
  TextStyle decorateTextStyle({
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
    bool? controlOverflow,
  }) =>
      GoogleFonts.getFont(
        nunitoFont,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textStyle: TextStyle(
          overflow: controlOverflow ?? false ? TextOverflow.ellipsis : null,
        ),
      );
}

extension DecorateTextSpan on TextSpan {
  TextSpan decorateTextSpan({
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
    bool? controlOverflow,
  }) =>
      TextSpan(
        text: text,
        recognizer: recognizer,
        style: GoogleFonts.getFont(
          nunitoFont,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          textStyle: TextStyle(
            overflow: controlOverflow ?? false ? TextOverflow.ellipsis : null,
          ),
        ),
      );
}
