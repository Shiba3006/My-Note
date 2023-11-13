

import 'package:flutter/material.dart';
import 'package:my_note/views/widgets/custom_button.dart';

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
        children: [
          SizedBox(height: 50,),
          CustomButton(
              onPressed: (){},
            text: 'Choose app color',
          ),
        ],
      ),
    );
  }
}
