import 'package:flutter/material.dart';

import 'package:my_note/cubits/main_cubit.dart';
import 'package:my_note/views/widgets/custom_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/views/widgets/custom_show_dialog.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                  color: MainCubit.get(context).currentColor,
                ),
                width: 120,
                height: 120,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => const CustomAlertDialog(),
                  );
                },
                text: 'Pick color',
              ),
            ],
          ),
        );
      },
    );
  }
}
