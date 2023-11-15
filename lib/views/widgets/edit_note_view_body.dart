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

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title , subTitle;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
               const SizedBox(height: 50,),
              CustomAppBar(
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                  }else {
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
                onSaved: (value){
                  title = value;
                },
                hint: 'title',
                maxLine: 1,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onSaved: (value){
                  subTitle = value;
                },
                hint: 'content',
                maxLine: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
