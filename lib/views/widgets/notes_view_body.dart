import 'package:flutter/material.dart';
import 'package:my_note/views/widgets/custom_sliver_app_bar.dart';

import 'custom_sliver_list.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        CustomSliverList(),
      ],
    );
  }
}








