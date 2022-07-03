import 'package:flutter/material.dart';
import 'package:b_sure/models/Package.dart';
import 'package:b_sure/size_config.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    Key? key,
    required this.package,
  }) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(60)),
          child: SizedBox(
            width: getProportionateScreenWidth(220),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(package.images[0]),
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ...buildPreviewList()
        //   ],
        // )
      ],
    );
  }

  List<Widget> buildPreviewList() {
    return List.generate(
      package.images.length,
      (index) => Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          package.images[index],
        ),
      ),
    );
  }
}
