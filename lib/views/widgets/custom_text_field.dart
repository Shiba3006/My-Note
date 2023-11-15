import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint,  this.maxLine = 1,required this.onSaved});

  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value){
        if(value?.isEmpty ?? true) {
          return 'field is required';
        }
        return null;
      },
      onSaved: onSaved,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
