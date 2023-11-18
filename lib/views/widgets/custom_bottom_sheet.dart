import 'package:flutter/material.dart';

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
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(hint: 'hint', onSaved: (value){}),
              const SizedBox(height: 15),
              CustomTextField(hint: 'hint', onSaved: (value){}, maxLine: 5),
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
                  Expanded(
                    child: Container(// color circle to show the picker color.
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: NotesCubit.get(context).currentColor,
                      ),
                    ),
                  ),
                ],
              ),
              CustomButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomAlertDialog(),
                  );
                },
                text: 'Pick color',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
