import 'package:flutter/material.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/screens/otp/components/otp_form.dart';
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
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text("OTP Verification", style: headingStyle),
              const Text("We sent your code on your number"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.17),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              GestureDetector(
                onTap: () {
                  //resend OTP Function
                },
                child: const Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Code will Expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 00),
          duration: const Duration(seconds: 60),
          builder: (context, num value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
