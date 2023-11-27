import 'package:flutter/material.dart';

import 'package:my_note/cubits/notes_cubit.dart';
import 'package:my_note/views/widgets/custom_alert_dialog.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
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
          InkWell(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (context) => const CustomAlertDialog(),);
            },
            child: Center(
              child: Container( // color circle to show the picker color.
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: NotesCubit.get(context).currentColor,
                ),
                width: 120,
                height: 120,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
