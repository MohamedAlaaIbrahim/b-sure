import 'package:flutter/material.dart';
import 'package:b_sure/components/package_ac_field.dart';
import 'package:b_sure/screens/details/components/top_rounded_container.dart';

class PackageRequestForm extends StatelessWidget {
  const PackageRequestForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopRoundedContainer(
      color: const Color(0xFFF6F7F9),
      child: Column(
        children: const [
          PackageACField(
            assets: "assets/data/phones.json",
            title: "Mobile Model",
            hint: "Choose Your Model",
          ),
          PackageACField(
            assets: "assets/data/phones.json",
            title: "Mobile Model",
            hint: "Choose Your Model",
          ),
          PackageACField(
            assets: "assets/data/phones.json",
            title: "Mobile Model",
            hint: "Choose Your Model",
          ),
          PackageACField(
            assets: "assets/data/phones.json",
            title: "Mobile Model",
            hint: "Choose Your Model",
          ),
          PackageACField(
            assets: "assets/data/phones.json",
            title: "Mobile Model",
            hint: "Choose Your Model",
          ),
        ],
      ),
    );
  }
}
