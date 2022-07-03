import 'package:flutter/material.dart';
import 'package:b_sure/models/Package.dart';
import 'package:b_sure/screens/details/components/body.dart';
import 'package:b_sure/screens/details/components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final PackageDetailsArguments args =
        (ModalRoute.of(context)?.settings.arguments) as PackageDetailsArguments;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: args.package.rating),
      body: Body(package: args.package),
    );
  }
}

class PackageDetailsArguments {
  Package package;

  PackageDetailsArguments({required this.package});
}
