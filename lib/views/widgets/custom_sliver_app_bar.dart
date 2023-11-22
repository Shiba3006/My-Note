import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/views/setting_view.dart';

import '../../cubits/notes_cubit.dart';
import '../test_notification_view.dart';


class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return SliverAppBar(
          expandedHeight: 220,
          leading: IconButton(
            onPressed: () {
              cubit.navigateTo(context, const SettingView());
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                cubit.navigateTo(context, const TestLocalNotification());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ],
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
