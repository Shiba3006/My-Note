import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/cubits/notes_cubit.dart';

class CustomRepeatSwitch extends StatelessWidget {
  const CustomRepeatSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Repeater:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Switch(
                  value: cubit.isRepeaterSwitchOn,
                  onChanged: (value) {
                    cubit.changeRepeaterSwitchState(value: value);
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
