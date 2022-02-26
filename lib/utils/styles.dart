
// styles and colors used across the entire app


import 'package:flutter/material.dart';

Color kPrimaryColor = const Color.fromARGB(255, 31, 53, 71);
Color kSecondaryColor = Colors.white;

Color kDarkBackgroundColor = Colors.black;

Padding horizontalPadding({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: child,
  );
}

TextStyle buttonHeadings = TextStyle(color: kSecondaryColor);
TextStyle appBarHeading = TextStyle(color: kSecondaryColor, fontSize: 20, fontWeight: FontWeight.w600);
