import 'package:flutter/material.dart';
import 'package:b_sure/components/no_account_text.dart';
import 'package:b_sure/components/social_card.dart';
import 'package:b_sure/screens/sign_in/components/sign_in_form.dart';
import 'package:b_sure/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Welcome Back, Alaa!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const Text(
                  "Sign in using Email and Password \n or continue using Your Social Media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/googleL.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/facebookL.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/twitterL.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                const NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
