import 'package:flutter/material.dart';

Color kPrimaryColor = Colors.white;
Color kLightBackgroundColor = Colors.white;

Padding horizontalPadding({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: child,
  );
}

TextStyle buttonHeadings = TextStyle(color: kPrimaryColor);
