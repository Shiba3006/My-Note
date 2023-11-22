import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';


class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String? searchText;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          CustomTextFormField(
            onSaved: (value){
              searchText = value;
            },
            hint: 'Search....',
          ),
          // const Expanded(
          //     child: NotesListView(),
          // ),
        ],
      ),
    );
  }
}
