import 'package:flutter/material.dart';

class GenericIconButton extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final void Function() onPressed;

  const GenericIconButton(
      {super.key, required this.icon, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
      ),
    );
  }
}
