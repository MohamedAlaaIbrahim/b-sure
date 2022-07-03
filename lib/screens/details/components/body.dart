import 'package:flutter/material.dart';
import 'package:b_sure/components/default_button.dart';
import 'package:b_sure/models/Package.dart';
import 'package:b_sure/screens/details/components/package_request_form.dart';
import 'package:b_sure/screens/details/components/product_description.dart';
import 'package:b_sure/screens/details/components/product_image.dart';
import 'package:b_sure/screens/details/components/top_rounded_container.dart';
import 'package:b_sure/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.package}) : super(key: key);
  final Package package;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductImages(package: package),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(package: package),
                  const PackageRequestForm(),
                  const SizedBox(height: 50),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child:
                          DefaultButton(text: "Request Visit", press: () {})),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
