import 'package:flutter/material.dart';
import 'package:my_note/cubits/notes_cubit.dart';
import 'package:my_note/views/roaa_view.dart';
import 'package:my_note/views/widgets/custom_fab.dart';
import 'package:my_note/views/widgets/notes_view_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class NotesView extends StatelessWidget {
  const NotesView({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var cubit = NotesCubit.get(context);
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is RoaaSuccessState) {
          NotesCubit.get(context).navigateTo(context, RoaaView());
        } else if (state is GetNoteSuccessState) {
          Navigator.pop(context);
        } else if (state is ChangeColorSuccessState){
          cubit.noteColor = NotesCubit.get(context).color;
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: cubit.scaffoldKey,
          floatingActionButton: const CustomFab(),
          body: const NotesViewBody(),
        );
      },
    );
  }
}
