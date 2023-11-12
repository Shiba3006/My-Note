
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;
  final bool forwardIos;
  final int infoCount;

  const CustomListTile({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.title,
    this.forwardIos = false,
    required this.infoCount,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.all(10),
          width: isCollapsed ? 300 : 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge.count(
                count: infoCount,
                isLabelVisible: infoCount > 0,
                textStyle: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
                child: Icon(icon, color: Colors.white),
              ),
              if (isCollapsed) ...[
                const Expanded(
                  flex: 0,
                  child: SizedBox(width: 10),
                ),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                ),
                if (forwardIos)
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}