import 'package:flutter/material.dart';
import 'package:b_sure/components/default_button.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/screens/home/home_screen.dart';
import 'package:b_sure/size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focusNode}) {
    if (value!.isNotEmpty) {
      focusNode?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOtpField(focusNodeToo: pin2FocusNode, focus: true),
              buildOtpField(
                  focusNode: pin2FocusNode,
                  focusNodeToo: pin3FocusNode,
                  focus: false),
              buildOtpField(
                  focusNode: pin3FocusNode,
                  focusNodeToo: pin4FocusNode,
                  focus: false),
              buildOtpField(focusNode: pin4FocusNode, focus: false),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Submit",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          )
        ],
      ),
    );
  }

  SizedBox buildOtpField(
      {FocusNode? focusNode, FocusNode? focusNodeToo, required bool focus}) {
    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: TextFormField(
        maxLength: 1,
        autofocus: true,
        focusNode: focusNode,
        obscureText: true,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
        decoration: otpInputDecorator,
        onChanged: (value) {
          if (focusNodeToo == null) {
            focusNode?.unfocus();
          } else {
            nextField(value: value, focusNode: focusNodeToo);
          }
        },
      ),
    );
  }
}
