import 'package:flutter/material.dart';
import 'package:b_sure/size_config.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      width: double.infinity,
      height: getProportionateScreenHeight(120),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
        TextSpan(
          text: "Welcome to The First Verison Of Pinsurance!\n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "Let's Enjoy The Journey Together\n",
            ),
            TextSpan(
              text: "You Special Special Person!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
