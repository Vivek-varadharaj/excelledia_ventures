import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue)
      )),
    );
  }
}
