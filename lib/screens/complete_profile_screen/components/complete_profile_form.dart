import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:b_sure/components/custom_svg_icon.dart';
import 'package:b_sure/components/default_button.dart';
import 'package:b_sure/components/error_form.dart';
import 'package:b_sure/constants.dart';
import 'package:b_sure/screens/otp/otp_screen.dart';
import 'package:b_sure/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDobFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          ErrorForm(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildFirstNFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      // onSaved: (newValue) => email = newValue!,
      controller: firstName,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your First Name",
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/user.svg', l: 0, r: 10, b: 10, t: 10, h: 8),
      ),
    );
  }

  TextFormField buildLastNFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      // onSaved: (newValue) => email = newValue!,
      controller: lastName,
      // onChanged: (value) {
      //   if (value.isNotEmpty && errors.contains(kNameNullError)) {
      //     setState(() {
      //       errors.remove(kNameNullError);
      //     });
      //   }
      // },
      // validator: (value) {
      //   if (value!.isEmpty && !errors.contains(kNameNullError)) {
      //     setState(() {
      //       errors.add(kNameNullError);
      //     });
      //   }
      //   return null;
      // },
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your Last Name",
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/user.svg', l: 0, r: 10, b: 10, t: 10, h: 8),
      ),
    );
  }

  TextFormField buildDobFormField() {
    return TextFormField(
      controller: dob,
      decoration: const InputDecoration(
        labelText: "Enter Date",
        hintText: "Please Select Your Date of Birth",
        // icon: Icon(Icons.calendar_today),
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/user.svg', l: 0, r: 10, b: 10, t: 10, h: 8),
      ),
      readOnly: true,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kDOBNullError)) {
          setState(() {
            errors.add(kDOBNullError);
          });
        }
        return null;
      },
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          if (errors.contains(kDOBNullError)) {
            setState(() {
              errors.remove(kDOBNullError);
            });
          }
          setState(() {
            dob.text = formattedDate;
          });
        }
      },
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      // onSaved: (newValue) => email = newValue!,
      controller: phoneNumber,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Mobile Number",
        hintText: "Enter your Mobile Number",
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/user.svg', l: 0, r: 10, b: 10, t: 10, h: 8),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      // onSaved: (newValue) => email = newValue!,
      controller: address,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kAddressNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kAddressNullError)) {
          setState(() {
            errors.add(kAddressNullError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your Address",
        suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/user.svg', l: 0, r: 10, b: 10, t: 10, h: 8),
      ),
    );
  }
}
