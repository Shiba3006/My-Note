
import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isCollapsable;

  const CustomDrawerHeader({
    super.key,
    required this.isCollapsable,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.edit,
            size: 30.0,
          ),
          if (isCollapsable) ...[
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'My Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}