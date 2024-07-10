import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRepeatSlider extends StatefulWidget {
  const CustomRepeatSlider({super.key});

  @override
  State<CustomRepeatSlider> createState() => _CustomRepeatSliderState();
}

class _CustomRepeatSliderState extends State<CustomRepeatSlider> {
  int _currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoSlidingSegmentedControl(
          thumbColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          groupValue: _currentSelection,
          children: const <int, Widget>{
            0: Text('Daily'),
            1: Text('Weekly'),
            2: Text('Monthly'),
            3: Text('Yearly'),
          },
          onValueChanged: (int? newValue) {
            setState(() {
              _currentSelection = newValue ?? 0;
            });
          },
        ),
      ],
    );
  }
}
