import 'package:flutter/material.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/screens/sign_in/sign_in_screen.dart';
import 'package:b_sure/size_config.dart';
import '../../../components/default_button.dart';
import 'splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "You Don't need to worry about Breaking your Phone anymore",
      "image": "assets/images/download.jpeg"
    },
    {
      "text": "We Will Take it from you",
      "image": "assets/images/download (1).jpeg"
    },
    {"text": "Fix It", "image": "assets/images/download (2).jpeg"},
    {
      "text": "And give it Back as Good as New",
      "image": "assets/images/fix.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 7,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                        image: splashData[index]["image"] ?? '',
                        text: splashData[index]["text"] ?? '',
                      ))),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length, (index) => buildDot(index: index)),
                  ),
                  const Spacer(flex: 2),
                  DefaultButton(
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      text: "HOLY FUCK LEZZZZZ GO"),
                  const Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(3)),
    );
  }
}
