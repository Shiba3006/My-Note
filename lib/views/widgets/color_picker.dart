import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_note/cubits/notes_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BuildColorPicker extends StatefulWidget {
  const BuildColorPicker({super.key});

  @override
  State<BuildColorPicker> createState() => _BuildColorPickerState();
}

class _BuildColorPickerState extends State<BuildColorPicker> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlockPicker(
          pickerColor: NotesCubit.get(context).currentColor ?? Colors.grey,
          // another type

          // enableAlpha: false,
          // labelTypes: [],
          availableColors: const [
            Colors.green,
            Colors.orange,
            Colors.blue,
            Colors.purpleAccent,
            Colors.yellow,
            Colors.cyanAccent,
            Colors.purple,
            Colors.red,
            Colors.deepOrange,
            Colors.teal,
            Colors.indigoAccent,
            Colors.amber,
            Colors.cyan,
            Colors.blueGrey,
            Colors.brown,
            Colors.black,
          ],
          onColorChanged: (newColor) {
            return NotesCubit.get(context).changeAppColor(newColorValue: newColor.value);
          }
        );
      },
    );

    // another type.
    // ColorPicker(
    //   pickerColor: color,
    //   // enableAlpha: false,
    //   // labelTypes: [],
    //
    //   onColorChanged: (newColor) => setState(() {
    //     color = newColor;
    //     print(color);
    //   }),
    // );
  }
}
