import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Theme/fontsize.dart';
import 'package:trucks/Common/Theme/fontweight.dart';
import 'package:trucks/Features/Auth/widgets/generic_text.dart';

class GenericCardWidgetWithLeadingWidget extends StatelessWidget {
  final void Function() onTap;
  final String title, subtitle;
  final Widget leadingWidgt;

  const GenericCardWidgetWithLeadingWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.leadingWidgt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 0.2,
            color: blackColor.withOpacity(0.5),
          ),
        ),
        minLeadingWidth: 0,
        leading: leadingWidgt,
        dense: true,
        onTap: onTap,
        title: GenericText(
          noCenterAlign: true,
          fontSize: fontSize3half,
          fontWeight: fontWeight7,
          text: title,
        ),
        subtitle: GenericText(
          noCenterAlign: true,
          fontSize: fontSize2half,
          fontWeight: fontWeight3,
          text: subtitle,
        ),
      ),
    );
  }
}
