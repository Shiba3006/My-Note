import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_note/cubits/notes_cubit.dart';

class BuildColorPicker extends StatefulWidget {
  const BuildColorPicker({super.key});

  @override
  State<BuildColorPicker> createState() => _BuildColorPickerState();
}

class _BuildColorPickerState extends State<BuildColorPicker> {

  @override
  Widget build(BuildContext context) {
    return BlockPicker(
      pickerColor: NotesCubit.get(context).currentColor,
      // another type

      // enableAlpha: false,
      // labelTypes: [],

      availableColors: const [
        Colors.green,
        Colors.orange,
        Colors.blue,
        Colors.purpleAccent,
        Colors.deepPurple,
        Colors.indigo,
        Colors.purple,
        Colors.red,
        Colors.deepOrange,
        Colors.teal,
        Colors.indigoAccent,
        Colors.lightGreen,
        Colors.cyan,
        Colors.blueGrey,
        Colors.brown,
        Colors.grey,
      ],
      onColorChanged: (newColor) {
        NotesCubit.get(context).changeAppColor(newColor: newColor);
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
