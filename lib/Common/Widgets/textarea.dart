import 'package:flutter/material.dart';

class TextAreas extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? minLines, maxLines, maxLength;
  final bool obscure;
  final void Function(String)? onChanged;
  final TextInputType? keyboard;
  final bool? enabled;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  const TextAreas({
    super.key,
    this.controller,
    required this.hintText,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.minLines,
    this.keyboard,
    this.obscure = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.border,
    this.enabled,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      enabled: enabled,
      style: hintStyle,
      decoration: InputDecoration(
        border: border,
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
