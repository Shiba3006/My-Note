import 'package:flutter/material.dart';
import 'package:my_note/views/widgets/add_note_view_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddNoteViewBody(),
    );
  }
}
