
// project packages
import 'package:excelledia_ventures/utils/styles.dart';

// flutter package
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const CustomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: kPrimaryColor.withOpacity(0.2)),
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: buttonHeadings,
      ),
    );
  }
}
