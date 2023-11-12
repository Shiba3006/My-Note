import 'package:flutter/material.dart';
import 'custom_drawer_header.dart';
import 'custom_list_tile.dart';
import 'owner.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 500),
      width: _isCollapsed ? 300 : 74,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Color(0x54CBC9C9),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            CustomDrawerHeader(isCollapsable: _isCollapsed),
            const Divider(color: Colors.grey),
            // home
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.house_outlined,
              title: 'Home',
              infoCount: 0,
            ),
            // calender
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.calendar_month_outlined,
              title: 'Calender',
              infoCount: 0,
            ),

            // notes
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.note_add_outlined,
              title: 'Notes',
              infoCount: 0,
            ),

            // notifications
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.notifications_none_outlined,
              title: 'Notifications',
              infoCount: 22,
            ),

            // settings
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.settings_outlined,
              title: 'Settings',
              infoCount: 0,
            ),

            // delete account
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.delete_outline,
              title: 'Delete Account',
              infoCount: 0,
            ),

            const Divider(color: Colors.grey),

            // about us
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.info_outline,
              title: 'About Us',
              infoCount: 0,
            ),

            // contact us
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.contact_support_outlined,
              title: 'Contact Us',
              infoCount: 0,
            ),

            // privacy policy
            CustomListTile(
              isCollapsed: _isCollapsed,
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              infoCount: 0,
            ),
            OwnerInfo(isCollapsed: _isCollapsed),
            Align(
              alignment:
              _isCollapsed ? Alignment.bottomRight : Alignment.bottomCenter,
              child: IconButton(
                splashColor: Colors.transparent,
                icon: Icon(
                  _isCollapsed ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
                onPressed: () {
                  setState(() {
                    _isCollapsed = !_isCollapsed;
                  });
                },
              ),
            ),
          ]
              .map(
                (e) => Padding(
              padding: e is Drawer
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(top: 10),
              child: e,
            ),
          ).toList(),
        ),
      ),
    );
  }
}