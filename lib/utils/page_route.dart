import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

PageTransition getPageRoute(BuildContext context, Widget page) {
  return PageTransition(
      child: page,
      type: PageTransitionType.leftToRightWithFade,
      curve: Curves.easeOutCirc);
}
