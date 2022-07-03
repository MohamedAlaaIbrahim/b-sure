import 'package:flutter/material.dart';
import 'package:b_sure/components/custom_svg_icon.dart';
import 'package:b_sure/components/default_button.dart';
import 'package:b_sure/components/error_form.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/home_nav.dart';
import 'package:b_sure/screens/forgot_password/forgot_password_screen.dart';
import 'package:b_sure/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  // late String email;
  // late String password;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool rememberme = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          Row(
            children: [
              Checkbox(
                value: rememberme,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    rememberme = value!;
                  });
                },
              ),
              const Text("Remember Me"),
              const Spacer(),
              forgotPasswordLink(context)
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          ErrorForm(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Sign In",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeNavScreen.routeName, (route) => false);
                // Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  GestureDetector forgotPasswordLink(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ForgotPasswordScreen.routeName,
      ),
      child: const Text("Forgot My Password",
          style: TextStyle(decoration: TextDecoration.underline)),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      // onSaved: (newValue) => password = newValue!,
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
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/lock.svg', l: 0, r: 10, b: 10, t: 10, h: 8),
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
