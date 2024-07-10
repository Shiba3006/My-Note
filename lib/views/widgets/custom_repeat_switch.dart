import 'package:flutter/material.dart';

class CustomRepeatSwitch extends StatelessWidget {
  const CustomRepeatSwitch({super.key});

  @override
  Widget build(BuildContext context) {
     return Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Set reminder:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Switch(
                  value: false,
                  onChanged: (value) {
                    // cubit.changeSwitchState(value: value);
                  },
                ),
              ),
            ],
          ),
        );
      
  }
}