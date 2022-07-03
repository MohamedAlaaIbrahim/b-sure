import 'package:flutter/material.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/screens/complete_profile_screen/components/complete_profile_form.dart';
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
                "A Bit More Personal",
                style: headingStyle,
              ),
              const Text(
                "Let us get to know you more",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              const CompleteProfileForm(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              const Text(
                "Terms and Condition Blah Blah. You know the Drill",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
