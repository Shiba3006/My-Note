import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key});

  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
  @override
  Widget build(BuildContext context) {
    return    const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            CustomAppBar(
              icon: FontAwesomeIcons.penToSquare,
              title: 'Add Note',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'title',
              maxLine: 1,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'content',
              maxLine: 23,
            ),
          ],
        ),
      ),
    );
  }
}
