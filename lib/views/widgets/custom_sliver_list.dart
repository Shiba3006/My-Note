import 'package:flutter/material.dart';

import 'note_item.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList({super.key});

  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => const NoteItem(),
      ),
    );
  }
}
