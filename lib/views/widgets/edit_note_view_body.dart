import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/notes_cubit.dart';

import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.index});

  final int index;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is GetNoteSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  CustomAppBar(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        cubit.updateNote(
                          index: widget.index,
                          title: title!,
                          subTitle: subTitle!,
                          date: cubit.customizeDateFormat(),
                          color: 144,
                        );
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                      }
                    },
                    icon: FontAwesomeIcons.check,
                    title: 'Edit Note',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    onSaved: (value) {
                      title = value;
                    },
                    hint: cubit.noteNotesList[widget.index].title,
                    maxLine: 1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    onSaved: (value) {
                      subTitle = value;
                    },
                    hint: cubit.noteNotesList[widget.index].subTitle,
                    maxLine: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
