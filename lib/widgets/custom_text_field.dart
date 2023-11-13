import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint,  this.maxLine = 1});

  final String hint;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
