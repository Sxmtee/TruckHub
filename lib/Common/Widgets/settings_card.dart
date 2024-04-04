import 'package:flutter/material.dart';
import 'package:trucks/Common/Utils/dimension.dart';

class SettingsCard extends StatelessWidget {
  final double height;
  final Widget child;
  const SettingsCard({
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Card(
      elevation: 0.5,
      child: SizedBox(
        height: height,
        width: SizeConfig.screenWidth,
        child: child,
      ),
    );
  }
}
