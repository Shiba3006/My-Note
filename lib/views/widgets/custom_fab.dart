import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<NotesCubit, NotesStates>(
  listener: (context, state) {
    if (state is GetNotesAndBSClosedSuccessState){
      Navigator.of(context).pop();
    }
  },
  builder: (context, state) {
    return FloatingActionButton(
      child: cubit.fabIcon,
      onPressed: () {
        int id =  DateTime.now().millisecondsSinceEpoch.remainder(10000);
        if (cubit.isBottomSheetOpen) {
          
          if (cubit.bottomSheetFormKey.currentState!.validate()) {
            cubit.bottomSheetFormKey.currentState!.save();
            cubit.addNote(
                notesModel: NoteModel(
                  id: id,
                  title: cubit.title!,
                  subTitle: cubit.subTitle!,
                  date: NotesCubit.get(context).customizeDateNowFormat(),
                  color: cubit.noteColor?.value ??
                      NotesCubit.get(context).currentColor.value,
                  notificationDate: cubit.date == null ? null : cubit.dateString,
                  notificationTime: cubit.time == null? null : cubit.timeString,
                ));
            if(cubit.date != null && cubit.time !=null){
              cubit.createScheduleNotification(
                dateTime: cubit.date!,
                timeOfDay: cubit.time!,
                title: cubit.title!,
                body: cubit.subTitle!,
              );
            }
          } else {
            cubit.autoValidateMode = AutovalidateMode.onUserInteraction;
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
          ).closed
              .then((value) {
            cubit.changeBottomSheetState(
              isBottomSheetOpen: false,
              icon: const Icon(FontAwesomeIcons.pencil),
            );
          });
        }
      },
    );
  },
);
  }
}
