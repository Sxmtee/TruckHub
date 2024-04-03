import 'package:flutter/material.dart';
import 'package:trucks/Common/Theme/color.dart';

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField2({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.onPressed,
    required this.obscureText,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.blackColor,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(
        fontFamily: 'Avenir',
        fontSize: 16,
        color: AppColors.blackColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: AppColors.blackColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(
            color: AppColors.redColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(
            color: AppColors.redColor,
          ),
        ),
        errorStyle: const TextStyle(
          fontFamily: 'Avenir',
          fontSize: 12,
        ),
        filled: true,
        fillColor: AppColors.greyColor,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            suffixIcon,
            color: AppColors.greyColor,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppColors.blackColor,
        ),
      ),
      validator: validator,
    );
  }
}
