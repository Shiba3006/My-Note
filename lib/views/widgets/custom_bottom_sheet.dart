import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/cubits/notes_cubit.dart';

import 'custom_alert_dialog.dart';
import 'custom_text_form_field.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: cubit.formKey,
              autovalidateMode: cubit.autoValidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                      hint: 'title',
                      onSaved: (value) {
                        cubit.title = value;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hint: 'content',
                    onSaved: (value) {
                      cubit.subTitle = value;
                    },
                    maxLine: 5,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Select note color:',
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  CustomAlertDialog(
                                      colorFunction: (newColor) {
                                        cubit.changeColor(newColor: newColor);
                                      }
                                  ),
                            );
                          },
                          child: Container(
                            // color circle to show the picked color.
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(
                              //   14,
                              // ),
                              color: cubit.noteColor ?? cubit.currentColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Set reminder (Optional):',
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Switch(
                              value: false,
                              onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
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
