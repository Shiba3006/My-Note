import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'notes_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomTextField(hint: 'Search....',),
          Expanded(
              child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
