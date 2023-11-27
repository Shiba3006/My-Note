import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit.dart';

class CustomReminderSwitch extends StatefulWidget {
  const CustomReminderSwitch({super.key});

  @override
  State<CustomReminderSwitch> createState() => _CustomReminderSwitchState();
}

class _CustomReminderSwitchState extends State<CustomReminderSwitch> {
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
                  'Reminder:',
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
                  value: cubit.isReminderSwitchOn,
                  onChanged: (value) {
                    cubit.changeSwitchState(value: value);
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
