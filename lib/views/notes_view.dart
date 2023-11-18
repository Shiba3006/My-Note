import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/main_cubit.dart';
import 'package:my_note/views/widgets/notes_view_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_note_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              FontAwesomeIcons.plus,
            ),
            onPressed: () {
              cubit.navigateTo(context, const AddNoteView());
              // scaffoldKey.currentState?.showBottomSheet((context) =>
              // Container(
              //   color: Colors.transparent,
              //   child: Padding(
              //     padding: const EdgeInsets.all(15.0),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         CustomTextField(hint: 'hint', onSaved: (value){}),
              //         CustomTextField(hint: 'hint', onSaved: (value){}),
              //         CustomTextField(hint: 'hint', onSaved: (value){}),
              //         CustomTextField(hint: 'hint', onSaved: (value){}),
              //       ],
              //     ),
              //   ),
              // ),
              //
              // );
            },
          ),
          body: const NotesViewBody(),
        );
      },
    );
  }
}
