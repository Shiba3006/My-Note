import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/main_cubit.dart';
import 'package:my_note/models/note_model.dart';


import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key});

  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  int? color;

  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context);
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if(state is GetNoteSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CustomAppBar(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          cubit.addNote(notesModel:  NoteModel(
                            title: title!,
                            subTitle: subTitle!,
                            date: cubit.customizeDateFormat(),
                            color: 1312,
                          ));
                        } else {
                          autoValidateMode = AutovalidateMode.always;
                        }
                      },
                      icon: FontAwesomeIcons.penToSquare,
                      title: 'Add Note',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        title = value;
                      },
                      hint: 'title',
                      maxLine: 1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        subTitle = value;
                      },
                      hint: 'content',
                      maxLine: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
