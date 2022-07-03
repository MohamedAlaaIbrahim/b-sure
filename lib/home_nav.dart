import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/screens/home/home_screen.dart';
import 'package:b_sure/screens/profile/profile_screen.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({Key? key}) : super(key: key);
  static String routeName = '/home_nav';

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          HomeScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                "assets/icons/package.svg",
                color: _selectedIndex == 0 ? kPrimaryColor : inActiveIconColor,
                height: 32,
                width: 32,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                "assets/icons/user.svg",
                color: _selectedIndex == 1 ? kPrimaryColor : inActiveIconColor,
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: onTapped,
        ),
      ),
    );
  }
}
