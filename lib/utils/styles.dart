import 'package:flutter/material.dart';

Color kPrimaryColor = Colors.blue;
Color kSecondaryColor = Colors.white;

Color kDarkBackgroundColor = Colors.black;

Padding horizontalPadding({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: child,
  );
}

TextStyle buttonHeadings = TextStyle(color: kPrimaryColor);
