import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:trucks/Common/Theme/color.dart';

showSnackBar(BuildContext context, String content) {
  showTopSnackBar(
    Overlay.of(context),
    SizedBox(
      height: 100,
      child: CustomSnackBar.info(
        backgroundColor: AppColors.primaryColor.withOpacity(0.7),
        message: content,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
