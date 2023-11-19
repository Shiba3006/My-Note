// import 'package:flutter/material.dart';
//
//
// import 'note_item.dart';
//
// class NotesListView extends StatelessWidget {
//   const NotesListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
//       child: ListView.separated(
//         padding: EdgeInsets.zero,
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) => NoteItem(index: index),
//         separatorBuilder: (context, index) => const SizedBox(
//           height: 8,
//         ),
//         itemCount: 10,
//       ),
//     );
//   }
// }
