import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/cubits/notes_cubit.dart';

import 'widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is ChangeColorSuccessState){
          NotesCubit.get(context).currentColor = NotesCubit.get(context).color!;
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: SettingViewBody(),
        );
      },
    );
  }
}
