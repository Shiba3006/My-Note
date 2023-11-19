import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/cubits/notes_cubit.dart';

import 'color_picker.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key, required this.colorFunction});

  final void Function(Color) colorFunction;

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AlertDialog(
          title: const Text(' Pick your color: '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildColorPicker(colorFunction: widget.colorFunction),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
