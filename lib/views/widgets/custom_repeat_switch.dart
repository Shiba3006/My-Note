import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit.dart';

class CustomRepeatSwitch extends StatefulWidget {
  const CustomRepeatSwitch({super.key});

  @override
  State<CustomRepeatSwitch> createState() => _CustomRepeatSwitchState();
}

class _CustomRepeatSwitchState extends State<CustomRepeatSwitch> {
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
                  'Repeat:',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall!.copyWith(
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: Switch(
                  value: cubit.isRepeatSwitchOn,
                  onChanged: (value) {
                    cubit.changeRepeatState(value: value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
