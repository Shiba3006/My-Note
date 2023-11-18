import 'package:flutter/material.dart';

import 'package:my_note/cubits/notes_cubit.dart';
import 'package:my_note/views/widgets/custom_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/views/widgets/custom_alert_dialog.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container( // color circle to show the picker color.
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: NotesCubit.get(context).currentColor,
            ),
            width: 120,
            height: 120,
          ),
          const SizedBox(
            height: 32,
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
    );
  }
}
