import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class RoaaView extends StatefulWidget {
  @override
  _RoaaViewState createState() => _RoaaViewState();
}

class _RoaaViewState extends State<RoaaView> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: _width / 2.7 * 2,
          width: _width / 2.7 * 2,
          child: Animator<double>(
            duration: const Duration(milliseconds: 1000),
            cycles: 0,
            curve: Curves.elasticOut,
            tween: Tween<double>(begin: 20.0, end: 25.0),
            builder: (context, animatorState, child) => Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: animatorState.value * 10,
                      color: const Color(0xFFFF5757),
                    ),
                    const Text(
                      'Roaa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Text(
                      'بحبك و مش عاوزك تزعلي مني ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
