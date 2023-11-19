import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/notes_cubit.dart';
import 'package:my_note/views/widgets/custom_bottom_sheet.dart';
import 'package:my_note/views/widgets/notes_view_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              FontAwesomeIcons.plus,
            ),
            onPressed: () {
              scaffoldKey.currentState?.showBottomSheet((context) =>
              const CustomBottomSheet(),
              );
            },
          ),
          body: NotesViewBody(),
        );
      },
    );
  }
}
