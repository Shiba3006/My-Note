import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_bottom_sheet.dart';


class CustomFab extends StatefulWidget {
  const CustomFab({super.key});

  @override
  State<CustomFab> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  @override
  Widget build(BuildContext context) {
    var cubit = NotesCubit.get(context);
    return FloatingActionButton(
      child: cubit.fabIcon,
      onPressed: () {
        if (cubit.isBottomSheetOpen) {
          if (cubit.formKey.currentState!.validate()) {
            cubit.formKey.currentState!.save();
            cubit.addNote(
                notesModel: NoteModel(
                  title: cubit.title!,
                  subTitle: cubit.subTitle!,
                  date: NotesCubit.get(context).customizeDateNowFormat(),
                  color: cubit.noteColor?.value ??
                      NotesCubit.get(context).currentColor.value,
                  notificationDate: cubit.date == null ? null : cubit.dateString,
                  notificationTime: cubit.time == null? null : cubit.timeString,
                ));
            cubit.createScheduleNotification(
              dateTime: cubit.date!,
              timeOfDay: cubit.time!,
              title: cubit.title!,
              body: cubit.subTitle!,
            );
            cubit.isReminderSwitchOn = false;
            cubit.dateController.text = '';
            cubit.timeController.text = '';
          } else {
            cubit.autoValidateMode = AutovalidateMode.always;
          }
        } else {
          cubit.changeBottomSheetState(
            isBottomSheetOpen: true,
            icon: const Icon(FontAwesomeIcons.plus),
          );
          cubit.scaffoldKey.currentState
              ?.showBottomSheet(
                (context) => const CustomBottomSheet(),
            elevation: 20,
          )
              .closed
              .then((value) {
            cubit.changeBottomSheetState(
              isBottomSheetOpen: false,
              icon: const Icon(FontAwesomeIcons.pencil),
            );
          });
        }
      },
    );
  }
}
