import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/cubits/notes_cubit.dart';
import 'custom_note_color_picker.dart';
import 'custom_reminder_switch.dart';
import 'custom_repeat_switch.dart';
import 'custom_text_form_field.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: cubit.formKey,
              autovalidateMode: cubit.autoValidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                      prefixIcon: Icons.title,
                      hint: 'title',
                      onSaved: (value) {
                        cubit.title = value;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    prefixIcon: Icons.subject,
                    hint: 'content',
                    onSaved: (value) {
                      cubit.subTitle = value;
                    },
                    maxLine: 5,
                  ),
                  const SizedBox(height: 15),
                   const Row(
                    children: [
                      CustomNoteColorPicker(),
                      SizedBox(
                        width: 10,
                      ),
                      CustomReminderSwitch(),
                      SizedBox(
                        width: 10,
                      ),
                      CustomRepeatSwitch(),
                    ],
                  ),
                  if (cubit.isReminderSwitchOn) ...[
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      prefixIcon: Icons.date_range,
                      hint: 'Date Reminder',
                      onSaved: (value) {
                        cubit.dateString = value;
                      },
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(3000),
                        ).then((value) {
                          cubit.setDate(newDate: value!);
                        });
                      },
                      controller: cubit.date == null ? null : cubit.dateController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      onTap: (){
                        showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                        ).then((value) {
                          cubit.setTime(newTime: value!, context: context);
                        });
                      },
                      controller: cubit.time == null ? null : cubit.timeController,
                      prefixIcon: Icons.watch_later,
                      hint: 'time Reminder',
                      onSaved: (value) {
                        cubit.timeString = value;
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
