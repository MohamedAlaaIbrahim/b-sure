import 'package:flutter/material.dart';
import 'package:b_sure/components/custom_svg_icon.dart';
import 'package:b_sure/size_config.dart';

class ErrorForm extends StatelessWidget {
  const ErrorForm({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => errorFormText(error: errors[index]),
      ),
    );
  }

  Row errorFormText({required String error}) {
    return Row(
      children: [
        const CustomSuffixIcon(
          svgIcon: "assets/icons/error.svg",
          l: 10,
          r: 0,
          b: 10,
          t: 10,
          h: 12,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
