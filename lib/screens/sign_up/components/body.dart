import 'package:flutter/material.dart';
import 'package:b_sure/components/social_card.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/screens/sign_up/components/signup_form.dart';
import 'package:b_sure/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              const Text(
                "Fill up your informatin and we'll get started \n with your new Account!",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              const SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
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
              SizedBox(height: getProportionateScreenHeight(20)),
              const Text(
                "By Continuing you confirm that you fuck bitches and get money and also agree with our Terms and Conditions",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
