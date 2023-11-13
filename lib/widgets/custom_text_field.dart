import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TextField(
      decoration: InputDecoration(
        hintText: 'title',
        border: OutlineInputBorder(),
      ),
    );
  }
}
