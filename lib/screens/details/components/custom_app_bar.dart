import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:b_sure/components/rounded_icon_btn.dart';
import 'package:b_sure/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.rating}) : super(key: key);
  final double rating;
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              icon: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    rating.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    "assets/icons/star.svg",
                    height: getProportionateScreenHeight(15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
