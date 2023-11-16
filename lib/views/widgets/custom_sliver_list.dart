import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/constants/constants.dart';
import 'package:my_note/cubits/main_cubit.dart';

import 'note_item.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList({super.key,});

  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList.separated(
            itemCount: myBox.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) => NoteItem(index: index),
          ),
        );
      },
    );
  }
}
