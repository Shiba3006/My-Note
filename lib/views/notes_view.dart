import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/views/add_note_view.dart';
import 'package:my_note/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          FontAwesomeIcons.plus,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNoteView()));
        },
      ),
      body: const NotesViewBody(),
    );
  }
}
