// project packages
import 'package:excelledia_ventures/utils/styles.dart';

// flutter packages
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmitted;
  const SearchField(
      {Key? key, required this.controller, required this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: kSecondaryColor),
      onSubmitted: (value) {
        onSubmitted();
      },
      controller: controller,
      decoration: InputDecoration(
          label: const Text("Search"),
          labelStyle: TextStyle(color: kSecondaryColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kSecondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kSecondaryColor))),
    );
  }
}
