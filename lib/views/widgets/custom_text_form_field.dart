import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key,
    required this.hint,
    this.maxLine = 1,
    required this.onSaved,
    this.controller,
    this.prefixIcon,
    this.onTap,
    this.enabled = true,
  });

  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final void Function()? onTap;
  final bool? enabled ;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }
        return null;
      },
      onTap: widget.onTap,
      controller: widget.controller,
      onSaved: widget.onSaved,
      maxLines: widget.maxLine,
      decoration: InputDecoration(
          prefixIcon: Icon(
          widget.prefixIcon,
        ),
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
