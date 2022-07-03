import 'package:flutter/material.dart';
import 'package:b_sure/components/custom_svg_icon.dart';
import 'package:b_sure/components/default_button.dart';
import 'package:b_sure/components/error_form.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:b_sure/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  // late String email;
  // late String password;
  // late String confirmPassword;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfPasswordField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          ErrorForm(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Next",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildConfPasswordField() {
    return TextFormField(
      controller: confirmPassword,
      obscureText: true,
      onChanged: (value) {
        if (password.text == value && errors.contains(kMatchPassError)) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          return "";
        } else if (password.text != value &&
            !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-Enter your Password",
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/lock.svg', l: 0, r: 10, b: 10, t: 10, h: 8),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: password,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            if (errors.contains(kShortPassError)) {
              errors.remove(kShortPassError);
            }
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/lock.svg',
          l: 0,
          r: 10,
          b: 10,
          t: 10,
          h: 8,
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue!,
      controller: email,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidator.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            if (errors.contains(kInvalidEmailError)) {
              errors.remove(kInvalidEmailError);
            }
            errors.add(kEmailNullError);
          });
        } else if (!emailValidator.hasMatch(value) &&
            !errors.contains(kInvalidEmailError) &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/user.svg', l: 0, r: 10, b: 10, t: 10, h: 8),
      ),
    );
  }
}
