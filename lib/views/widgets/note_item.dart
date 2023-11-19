import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/notes_cubit.dart';

import 'package:my_note/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = NotesCubit.get(context);
    return GestureDetector(
      onTap: () {
        cubit.navigateTo(context, EditNoteView(index: index,));
      },
      child: Container(
        decoration: BoxDecoration(
          color: NotesCubit.get(context).currentColor ,
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
                  cubit.noteNotesList[index].title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24.0,
                      ),
                ),
                subtitle: Text(
                  cubit.noteNotesList[index].subTitle,
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
                  Icon(
                    FontAwesomeIcons.clock,
                    size: 18,
                    color: Colors.black.withOpacity(.5),
                  ),
                  const Spacer(),
                  Text(
                    cubit.noteNotesList[index].date,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
