import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            CustomAppBar(
              icon: FontAwesomeIcons.check,
              title: 'Edit Note',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'title',
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
