import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/main_cubit.dart';
import 'package:my_note/views/add_note_view.dart';
import 'package:my_note/views/widgets/notes_view_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              FontAwesomeIcons.plus,
            ),
            onPressed: () {
              cubit.navigateTo(context, const AddNoteView());
            },
          ),
          body: const NotesViewBody(),
        );
      },
    );
  }
}
