import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_alert_dialog.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomFab extends StatefulWidget {
  const CustomFab({super.key});

  @override
  State<CustomFab> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = NotesCubit.get(context);
    return FloatingActionButton(
      child: cubit.fabIcon,
      onPressed: () {
        if (cubit.isBottomSheetOpen) {
          if (cubit.formKey.currentState!.validate()) {
            cubit.formKey.currentState!.save();
            NotesCubit.get(context).addNote(
                notesModel: NoteModel(
                  title: cubit.title!,
                  subTitle: cubit.subTitle!,
                  date: NotesCubit.get(context).customizeDateFormat(),
                  color: cubit.noteColor?.value ??
                      NotesCubit.get(context).currentColor!.value,
                ));
          } else {
            cubit.autoValidateMode = AutovalidateMode.always;
          }
        } else {
          cubit.changeBottomSheetState(
            isBottomSheetOpen: true,
            icon: const Icon(FontAwesomeIcons.plus),
          );
          cubit.scaffoldKey.currentState
              ?.showBottomSheet(
                (context) => SingleChildScrollView(
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
                            child: CustomButton(
                              onPressed: () {
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
                              text: 'Pick color',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              // color circle to show the picker color.
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  14,
                                ),
                                color: cubit.noteColor ??
                                    NotesCubit.get(context)
                                        .currentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            elevation: 20,
          )
              .closed
              .then((value) {
            cubit.changeBottomSheetState(
              isBottomSheetOpen: false,
              icon: const Icon(FontAwesomeIcons.pencil),
            );
          });
        }
      },
    );
  },
);
  }
}
