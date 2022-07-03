import 'package:flutter/material.dart';
import 'package:b_sure/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
      ),
      body: const Body(),
      // bottomNavigationBar:
      //     const CustomBottomNav(selectedMenu: MenuState.profile),
    );
  }
}
