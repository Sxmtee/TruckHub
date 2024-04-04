import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Theme/fontsize.dart';
import 'package:trucks/Common/Theme/fontweight.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Common/Widgets/text_button.dart';
import 'package:trucks/Features/Auth/widgets/generic_text.dart';

Future<T?> showYesOrNoAlertDialog<T>({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
}) =>
    showDialog<T>(
      context: context,
      builder: (_) => AlertDialog(
        titlePadding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
        actionsAlignment: MainAxisAlignment.spaceAround,
        title: Center(
          child: GenericText(
            text: title,
            color: blackColor,
            fontWeight: fontWeight6,
            fontSize: fontSize3,
          ),
        ),
        actions: [
          GenericTextButton(
            fontSize: fontSize3,
            fontWeight: fontWeight7,
            onTap: () => Navigator.pop(context),
            title: noString,
          ),
          GenericTextButton(
            fontSize: fontSize3,
            fontWeight: fontWeight7,
            onTap: onTap,
            title: yesString,
          )
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        scrollable: true,
        backgroundColor: whiteColor,
      ),
    );
