import 'package:flutter/material.dart';
import 'package:my_note/views/widgets/custom_button.dart';
import 'package:my_note/views/widgets/custom_text_form_field.dart';

import '../../cubits/notes_cubit.dart';

class CustomEditNoteAlert extends StatefulWidget {
  const CustomEditNoteAlert({super.key, required this.index});

  final int index;

  @override
  State<CustomEditNoteAlert> createState() => _CustomEditNoteAlertState();
}

class _CustomEditNoteAlertState extends State<CustomEditNoteAlert> {

  final GlobalKey<FormState> noteFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var cubit = NotesCubit.get(context);
    return AlertDialog(
      title: const Text(' Edit the note : '),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: noteFormKey,
            autovalidateMode: cubit.autoValidateMode,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                    initialValue: cubit.notesList[widget.index].title,
                    prefixIcon: Icons.title,
                    hint: 'title',
                    onSaved: (value) {
                      cubit.title = value;
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  initialValue: cubit.notesList[widget.index].subTitle,
                  prefixIcon: Icons.subject,
                  hint: 'content',
                  onSaved: (value) {
                    cubit.subTitle = value;
                  },
                  maxLine: 5,
                ),
                const SizedBox(height: 15),
                if (cubit.notesList[widget.index].notificationDate != null) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    initialValue:
                        cubit.notesList[widget.index].notificationDate,
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        cubit.setTime(newTime: value!, context: context);
                      });
                    },
                    initialValue:
                        cubit.notesList[widget.index].notificationTime,
                    prefixIcon: Icons.watch_later,
                    hint: 'time Reminder',
                    onSaved: (value) {
                      cubit.timeString = value;
                    },
                  ),
                ],
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPressed: () {
                    noteFormKey.currentState!.save();
                    cubit.updateNote(
                      id: cubit.notesList[widget.index].id,
                      index: widget.index,
                      title: cubit.title!,
                      subTitle: cubit.subTitle!,
                      color: cubit.notesList[widget.index].color,
                      notificationDate:
                          cubit.notesList[widget.index].notificationDate != null
                              ? cubit.dateString
                              : null,
                      notificationTime:
                          cubit.notesList[widget.index].notificationTime != null
                              ? cubit.timeString
                              : null,
                    );
                    Navigator.pop(context);
                  },
                  text: 'Update',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
