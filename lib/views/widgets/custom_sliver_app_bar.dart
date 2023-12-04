import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/views/widgets/custom_alert_dialog.dart';
import '../../cubits/notes_cubit.dart';


class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({super.key});

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SliverAppBar(
          expandedHeight: 220,
          leading:
          IconButton(
            onPressed: () {
              NotesCubit.get(context).isSetting = true;
              showDialog(
                context: context,
                builder: (context) => const CustomAlertDialog(),)
                  .then((value) {});
            },
            icon: const Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          pinned: true,
          backgroundColor: NotesCubit
              .get(context)
              .currentColor,
          flexibleSpace: const FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              'NOTES',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}
