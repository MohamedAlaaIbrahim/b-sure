import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:b_sure/size_config.dart';

class PackageACField extends StatefulWidget {
  const PackageACField({
    Key? key,
    required this.assets,
    required this.title,
    required this.hint,
  }) : super(key: key);

  final String assets;
  final String title;
  final String hint;

  @override
  State<PackageACField> createState() => _PackageACFieldState();
}

class _PackageACFieldState extends State<PackageACField> {
  bool isLoading = false;
  late List<String> autoCompleteData;

  late TextEditingController controllerE;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = false;
    });

    final String stringData = await rootBundle.loadString(widget.assets);
    final List<dynamic> json = jsonDecode(stringData);
    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    } else {
                      return autoCompleteData.where((word) => word
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                    }
                  },
                  optionsViewBuilder:
                      (context, Function(String) onSelected, options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 4,
                        child: SizedBox(
                          width: getProportionateScreenWidth(200),
                          height: getProportionateScreenWidth(100),
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final option = options.elementAt(index);
                              return ListTile(
                                title: SubstringHighlight(
                                  text: option.toString(),
                                  term: controllerE.text,
                                  textStyleHighlight: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                                onTap: () {
                                  onSelected(option.toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: options.length,
                          ),
                        ),
                      ),
                    );
                  },
                  fieldViewBuilder:
                      (context, controller, focusNode, onEditingComplete) {
                    controllerE = controller;
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      decoration: InputDecoration(
                        labelText: widget.title,
                        hintText: widget.hint,
                      ),
                    );
                  },
                ),
              ],
            ),
          ));
  }
}
