import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/models/Package.dart';
import 'package:b_sure/size_config.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.package,
    required this.press,
  }) : super(key: key);

  final double width, aspectRatio;
  final Package package;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(package.images[0]),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    package.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    package.description,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                      width: getProportionateScreenWidth(28),
                      height: getProportionateScreenWidth(28),
                      child: SvgPicture.asset(
                        package.isFav
                            ? "assets/icons/heart.svg"
                            : "assets/icons/heartE.svg",
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
