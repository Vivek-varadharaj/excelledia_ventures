import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  TextEditingController controller;
   SearchField({
    Key? key, required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
  }
}
