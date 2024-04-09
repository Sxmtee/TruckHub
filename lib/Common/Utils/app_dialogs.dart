import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Utils/dimension.dart';

class AppDialogs extends StatelessWidget {
  final String titleText;
  final String contentText;
  final String commandText;
  final VoidCallback commandPress;
  const AppDialogs({
    super.key,
    required this.titleText,
    required this.contentText,
    required this.commandText,
    required this.commandPress,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    Color? containerColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[900]
        : whiteColor;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: SizeConfig.sHeight * 75,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              titleText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(contentText),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: AppColors.tertiaryColor),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.sWidth * 2.77,
                ),
                TextButton(
                  onPressed: commandPress,
                  child: Text(
                    commandText,
                    style: TextStyle(color: AppColors.tertiaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
