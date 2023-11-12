import 'package:flutter/material.dart';

class OwnerInfo extends StatelessWidget {
  final bool isCollapsed;

  const OwnerInfo({
    super.key,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isCollapsed ? 74 : 100,
      width: double.infinity,
      padding: isCollapsed
          ? const EdgeInsets.symmetric(horizontal: 10)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isCollapsed
          ? IntrinsicHeight(
        child: Row(
          children: [
            const Expanded(
              child: OwnerAvatar(),
            ),
            // name and username
            const SizedBox(width: 10),
            const Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // name
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Note',
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  // username
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '@SH3006',
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )
          : Column(
        children: [
          const Expanded(
            child: OwnerAvatar(),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// owner image
class OwnerAvatar extends StatelessWidget {
  const OwnerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 22,
      //backgroundImage: NetworkImage('https://imgur.com/ivPXgoz.png'),
    );
  }
}