import 'package:flutter/material.dart';
import 'package:b_sure/screens/home/components/categories.dart';
import 'package:b_sure/screens/home/components/home_header.dart';
import 'package:b_sure/screens/home/components/package_grid_view.dart';
import 'package:b_sure/screens/home/components/section_title.dart';
import 'package:b_sure/screens/home/components/welcome_banner.dart';
import 'package:b_sure/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String section = "Mobile";

  void changeSection(newValue) {
    setState(() {
      section = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(2)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(2)),
            const WelcomeBanner(),
            SizedBox(height: getProportionateScreenWidth(15)),
            Categories(changeSection: changeSection),
            SizedBox(height: getProportionateScreenWidth(15)),
            SectionTitle(section: section),
            PackageGridView(section: section),
          ],
        ),
      ),
    );
  }
}
