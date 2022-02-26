import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  TextEditingController controller;
  Function onSubmitted;
  SearchField({Key? key, required this.controller, required this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted(),
      controller: controller,
      decoration: const InputDecoration(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
  }
}
