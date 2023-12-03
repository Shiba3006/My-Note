import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/notes_cubit.dart';

import 'custom_edit_note_alert.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => CustomEditNoteAlert(
                      index: index,
                    )).then((value) {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(NotesCubit.get(context).notesList[index].color),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 15.0,
                    start: 15.0,
                  ),
                  child: ListTile(
                    title: Text(
                      cubit.notesList[index].title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 24.0,
                          ),
                    ),
                    subtitle: Text(
                      cubit.notesList[index].subTitle,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20,
                            color: Colors.black.withOpacity(.6),
                          ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        cubit.deleteNote(index: index);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.trash,
                        size: 26.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    end: 20.0,
                    bottom: 15.0,
                    start: 30,
                  ),
                  child: Row(
                    children: [
                      if (cubit.notesList[index].notificationDate != null)
                        Icon(
                          FontAwesomeIcons.clock,
                          size: 18,
                          color: Colors.black.withOpacity(.5),
                        ),
                      const Spacer(),
                      Text(
                        cubit.notesList[index].date,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
