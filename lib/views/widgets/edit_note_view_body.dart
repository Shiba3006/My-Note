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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            CustomAppBar(
              onPressed: (){},
              icon: FontAwesomeIcons.check,
              title: 'Edit Note',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
              hint: 'title',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
              hint: 'content',
              maxLine: 23,
            ),
          ],
        ),
      ),
    );
  }
}
