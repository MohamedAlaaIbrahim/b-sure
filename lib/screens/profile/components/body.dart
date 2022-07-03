import 'package:flutter/material.dart';
import 'package:b_sure/screens/profile/components/profile_menu.dart';
import 'package:b_sure/screens/profile/components/profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            icon: "assets/icons/user.svg",
            text: "My Info",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/package.svg",
            text: "My Packages",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/settings.svg",
            text: "Settings",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/help.svg",
            text: "Help Center",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/logout.svg",
            text: "Log Out",
            press: () {},
          ),
        ],
      ),
    );
  }
}
