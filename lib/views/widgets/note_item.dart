import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditNoteView()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
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
                  'The title',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24.0,
                      ),
                ),
                subtitle: Text(
                  'The sub title The sub title The sub title The sub title ',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 20,
                        color: Colors.black.withOpacity(.6),
                      ),
                ),
                trailing: IconButton(
                  onPressed: () {},
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
              ),
              child: Text(
                'Jan 11, 2024',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
