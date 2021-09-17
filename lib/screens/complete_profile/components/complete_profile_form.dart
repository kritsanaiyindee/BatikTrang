import 'dart:convert';
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:batiktrang/components/custom_surfix_icon.dart';
import 'package:batiktrang/components/default_button.dart';
import 'package:batiktrang/components/form_error.dart';
import 'package:batiktrang/models/shopuser.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  final fisrtnameController = TextEditingController();
  final lastmaneController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  void initState() {
    print('user    ${usr.email}');
    print('passwordhash    ${usr.passwordHash}');
    if(usr.email!=null){
      fisrtnameController.text=usr.firstName!;
      lastmaneController.text =usr.lastName!;
      phoneController.text =usr.mobile!;
      addressController.text =usr.lastName!;
    }
    super.initState();
  }
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  _signupClick() async {

    // SERVER API URL
    var url = Uri.parse('http://batiktrang.psautocar.com/register.php');
    print('user    ${usr.email}');
    print('passwordhash    ${usr.passwordHash}');
    // Store all data with Param Name.
    var data = { 'email': '${usr.email}',
                'password' : '${usr.passwordHash}',
                'firstname':'${fisrtnameController.text}',
                'lastname':'${lastmaneController.text}',
                'mobile':'${phoneController.text}',
                'address':'${addressController.text}',
      'admin':0,
      'vendor':0,
             };
    print('ddddddd  ${data}');
    print('ddddddd  ${json.encode(data)}');

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    print('ddddddd  ${response.body}');
    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(message=="true"){
      Navigator.pushNamed(context, HomeScreen.routeName);

    }else{
      addError(error: kAlreadyHavethisUser);


    }

    print('_signupClick  end');

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "บันทึก",
            press: () {
              if (_formKey.currentState!.validate()) {
                _signupClick();
               // Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressController,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ที่อยู๋",
        hintText: "โปรดระบุที่อยู่",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "เบอร์โทรศัพท์",
        hintText: "โปรดระบุเบอร์โทรศัพท์",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: lastmaneController,
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "นามสกุล",
        hintText: "โปรดระบุนามสกุล",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: fisrtnameController,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ชื่อ",
        hintText: "โปรดระบุชื่อ",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
