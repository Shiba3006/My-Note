
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstImageStack extends StatelessWidget {
  const FirstImageStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset('assets/images/note.png'),
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                ),
                Icon(
                  FontAwesomeIcons.pencil,
                  size: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '          WRITE YOUR FIRST NOTE..',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}
