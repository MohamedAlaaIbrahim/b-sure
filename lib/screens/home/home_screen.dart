import 'package:flutter/material.dart';
import 'package:b_sure/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      // bottomNavigationBar: CustomBottomNav(selectedMenu: MenuState.home),
    );
  }
}
