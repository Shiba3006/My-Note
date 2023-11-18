import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit.dart';
import 'custom_alert_dialog.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                      hint: 'title',
                      onSaved: (value) {
                        title = value;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    hint: 'content',
                    onSaved: (value) {
                      subTitle = value;
                    },
                    maxLine: 5,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const CustomAlertDialog(),
                            );
                          },
                          text: 'Pick color',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container( // color circle to show the picker color.
                          height: 30,
                          decoration: BoxDecoration(
                            //shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(
                              14,
                            ),
                            color: NotesCubit
                                .get(context)
                                .currentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    text: 'Save',
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
