import 'package:flutter/material.dart';
import 'package:b_sure/size_config.dart';

const kPrimaryColor = Color.fromARGB(255, 0, 68, 255);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA54E), Color(0xFFFF7643)]);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final RegExp emailValidator = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter Your Email";
const String kInvalidEmailError = "Please Enter a Valid Email";
const String kPassNullError = "Please Enter Your Password";
const String kShortPassError = "Password is Too Short";
const String kMatchPassError = "Passwords don't Match";
const String kNameNullError = "Please Enter Your Name";
const String kPhoneNumberNullError = "Please Enter Your Phone Number";
const String kAddressNullError = "Please Enter Your Address";
const String kDOBNullError = "Please Enter Your Date Of Birth";

final otpInputDecorator = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
  counterText: '',
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor),
  );
}
