// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_note/models/note_model.dart';
//
// import '../../cubits/notes_cubit.dart';
// import '../roaa_view.dart';
// import 'custom_alert_dialog.dart';
// import 'custom_button.dart';
// import 'custom_text_field.dart';
//
// class CustomBottomSheet extends StatefulWidget {
//   const CustomBottomSheet({super.key});
//
//   @override
//   State<CustomBottomSheet> createState() => _CustomBottomSheetState();
// }
//
// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//
//   final GlobalKey<FormState> formKey = GlobalKey();
//   AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
//   String? title, subTitle;
//   int? colorValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NotesCubit, NotesStates>(
//       listener: (context, state) {
//         if(state is RoaaSuccessState){
//           NotesCubit.get(context).navigateTo(context, RoaaView());
//         } else if (state is GetNoteSuccessState) {
//           Navigator.pop(context);
//         }
//       },
//       builder: (context, state) {
//         return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Form(
//               key: formKey,
//               autovalidateMode: autoValidateMode,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   CustomTextField(
//                       hint: 'title',
//                       onSaved: (value) {
//                         title = value;
//                       }),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   CustomTextField(
//                     hint: 'content',
//                     onSaved: (value) {
//                       subTitle = value;
//                     },
//                     maxLine: 5,
//                   ),
//                   const SizedBox(height: 15),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: CustomButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) => CustomAlertDialog(
//                                 colorFunction: (newColor) =>
//                                 colorValue = newColor.value,
//                               ),
//                             );
//                           },
//                           text: 'Pick color',
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Container( // color circle to show the picker color.
//                           height: 30,
//                           decoration: BoxDecoration(
//                             //shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.circular(
//                               14,
//                             ),
//                             color: Color(colorValue ?? NotesCubit
//                                 .get(context)
//                                 .currentColor!.value),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   CustomButton(
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         formKey.currentState!.save();
//                         NotesCubit.get(context).addNote(notesModel: NoteModel(
//                             title: title!,
//                             subTitle: subTitle!,
//                             date: NotesCubit.get(context).customizeDateFormat(),
//                             color: colorValue ?? NotesCubit
//                                 .get(context)
//                                 .currentColor!.value,
//                         ));
//                       } else {
//                         autoValidateMode =AutovalidateMode.always;
//                       }
//                     },
//                     text: 'Save',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
