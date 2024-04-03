import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

PageTransition<dynamic> pageRouter({
  required Widget child,
  RouteSettings? settings,
}) {
  return PageTransition(
    child: child,
    duration: const Duration(milliseconds: 500),
    reverseDuration: const Duration(milliseconds: 500),
    type: PageTransitionType.rightToLeft,
    settings: settings,
  );
}
