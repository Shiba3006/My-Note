import 'package:flutter/material.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  /// TODO : Make colors
  final colors = const []; // لبناء الالوان

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsetsDirectional.symmetric(vertical: 4.0),
          child: NoteItem(),
        ),
      ),
    );
  }
}