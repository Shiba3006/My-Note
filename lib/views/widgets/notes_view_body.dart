import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/notes_cubit.dart';
import 'package:my_note/views/widgets/custom_sliver_app_bar.dart';
import 'package:my_note/views/widgets/firest_image_stack.dart';

import 'custom_sliver_list.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            if (NotesCubit.get(context).notesList.isEmpty)
              SliverList.builder(
                itemCount: 1,
                itemBuilder: (context, index) => const FirstImageStack(),
              ),
            const CustomSliverList(),
          ],
        );
      },
    );
  }
}
