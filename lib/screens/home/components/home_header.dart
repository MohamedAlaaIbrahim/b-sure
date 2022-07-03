import 'package:flutter/material.dart';
import 'package:b_sure/screens/home/components/icon_btn_with_num.dart';
import 'package:b_sure/screens/home/components/search_bar.dart';
import 'package:b_sure/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchBar(),
          IconBtnWithNum(
            svgSrc: "assets/icons/cart.svg",
            numOfItems: 0,
            press: () {},
          ),
          IconBtnWithNum(
            svgSrc: "assets/icons/noti.svg",
            numOfItems: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
