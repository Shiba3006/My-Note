import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLine = 1,
      required this.onSaved,
      });

  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }
        return null;
      },
      onSaved: widget.onSaved,
      maxLines: widget.maxLine,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
