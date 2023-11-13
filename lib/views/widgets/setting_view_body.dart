import 'package:flutter/material.dart';

import 'package:my_note/cubits/main_cubit.dart';
import 'package:my_note/views/widgets/custom_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


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
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                onPressed: () {},
                text: 'Choose app color',
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MainCubit.get(context).primaryColor,
                ),
                width: 120,
                height: 120,
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  MainCubit.get(context).pickColor(context);
                },
                child: const Text(
                  'Pick color',
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}
