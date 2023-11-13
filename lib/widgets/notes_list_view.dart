import 'package:flutter/material.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 8.0),
        child: NoteItem(),
      ),
    );
  }
}