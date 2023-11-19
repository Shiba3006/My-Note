import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/cubits/notes_cubit.dart';
import 'package:my_note/views/roaa_view.dart';
import 'package:my_note/views/widgets/custom_alert_dialog.dart';

import 'package:my_note/views/widgets/custom_button.dart';
import 'package:my_note/views/widgets/custom_text_field.dart';
import 'package:my_note/views/widgets/notes_view_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/note_model.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  int? colorValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is RoaaSuccessState) {
          NotesCubit.get(context).navigateTo(context, RoaaView());
        } else if (state is GetNoteSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            child: cubit.fabIcon,
            onPressed: () {
              if (cubit.isBottomSheetOpen) {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  NotesCubit.get(context).addNote(
                      notesModel: NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: NotesCubit.get(context).customizeDateFormat(),
                    color: colorValue ??
                        NotesCubit.get(context).currentColor!.value,
                  ));
                } else {
                  autoValidateMode = AutovalidateMode.always;
                }
              } else {
                cubit.changeBottomSheetState(
                  isBottomSheetOpen: true,
                  icon: const Icon(FontAwesomeIcons.plus),
                );
                scaffoldKey.currentState
                    ?.showBottomSheet(
                      (context) => SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Form(
                            key: formKey,
                            autovalidateMode: autoValidateMode,
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
                                            builder: (context) =>
                                                CustomAlertDialog(
                                              colorFunction: (newColor) =>
                                                  colorValue = newColor.value,
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
                                          //shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          color: Color(colorValue ??
                                              NotesCubit.get(context)
                                                  .currentColor!
                                                  .value),
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
          ),
          body: const NotesViewBody(),
        );
      },
    );
  }
}
