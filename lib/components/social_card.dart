import 'package:flutter/material.dart';
import 'package:b_sure/components/custom_svg_icon.dart';
import 'package:b_sure/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          padding: EdgeInsets.all(getProportionateScreenWidth(8.5)),
          height: getProportionateScreenHeight(40),
          width: getProportionateScreenWidth(40),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle,
          ),
          child: CustomSuffixIcon(
            svgIcon: icon,
            l: 0,
            t: 0,
            r: 0,
            b: 0,
            h: 0,
          )),
    );
  }
}
