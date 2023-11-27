import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit.dart';
import 'custom_alert_dialog.dart';

class CustomNoteColorPicker extends StatefulWidget {
  const CustomNoteColorPicker({super.key});

  @override
  State<CustomNoteColorPicker> createState() => _CustomNoteColorPickerState();
}

class _CustomNoteColorPickerState extends State<CustomNoteColorPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Color:',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall!.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) =>
                          const CustomAlertDialog(),
                    );
                  },
                  child: Container(
                    // color circle to show the picked color.
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cubit.noteColor ?? cubit.currentColor,
                    ),
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
