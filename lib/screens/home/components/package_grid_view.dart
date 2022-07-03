import 'package:flutter/material.dart';
import 'package:b_sure/components/product_card.dart';
import 'package:b_sure/models/Package.dart';
import 'package:b_sure/screens/details/details_screen.dart';

class PackageGridView extends StatelessWidget {
  const PackageGridView({
    Key? key,
    required this.section,
  }) : super(key: key);

  final String section;

  int selSection(value) {
    if (section == "Mobile") {
      return 0;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      // crossAxisSpacing: getProportionateScreenWidth(5),
      childAspectRatio: 0.75,
      crossAxisCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        ...List.generate(
          demoPackages[selSection(section)].length,
          (index) {
            return PackageCard(
              package: demoPackages[selSection(section)][index],
              press: () => Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: PackageDetailsArguments(
                  package: demoPackages[selSection(section)][index],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
