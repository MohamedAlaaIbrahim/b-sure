import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
    required this.l,
    required this.t,
    required this.r,
    required this.b,
    required this.h,
  }) : super(key: key);

  final String svgIcon;
  final double l, t, r, b, h;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        l,
        getProportionateScreenWidth(t),
        getProportionateScreenWidth(r),
        getProportionateScreenWidth(b),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateScreenHeight(h),
      ),
    );
  }
}
