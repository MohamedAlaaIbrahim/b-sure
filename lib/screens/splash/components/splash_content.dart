import 'package:flutter/material.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(flex: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "B",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(50),
                color: const Color.fromARGB(255, 17, 99, 167),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "-SURE",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(50),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Image.asset(image,
            height: getProportionateScreenHeight(420),
            width: getProportionateScreenWidth(420))
      ],
    );
  }
}
