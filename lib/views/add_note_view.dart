import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/cubits/main_cubit.dart';
import 'package:my_note/views/widgets/add_note_view_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Scaffold(
          body: AddNoteViewBody(),
        );
      },
    );
  }
}
