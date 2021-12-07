import 'dart:convert';
import 'dart:developer';
import 'package:batiktrang/models/Cart.dart';
import 'package:batiktrang/models/Product.dart';
import 'package:batiktrang/models/productModel.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/sign_in/sign_in_screen.dart';
import 'package:batiktrang/screens/sign_up/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/components/custom_surfix_icon.dart';
import 'package:batiktrang/components/form_error.dart';
import 'package:batiktrang/helper/keyboard.dart';
import 'package:batiktrang/screens/forgot_password/forgot_password_screen.dart';
import 'package:batiktrang/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  bool _isLoading=false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final List<String?> errors = [];
  void initState() {
    emailController.text="thitipong49339@hotmail.com";
    passwordController.text="graf493310";


    emailController.text='shop1@batik.com';
    passwordController.text="Batik1234";


   // emailController.text='';
   // passwordController.text="";
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
  _loginClick() async {



    // SERVER API URL
    var url = Uri.parse('${weburi}/login.php');
    print('Uri  ${weburi}/login.php');
    // Store all data with Param Name.
    var data = { 'email': emailController.text, 'password' : passwordController.text};
    print('ddddddd  ${data}');
    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    print('ddddddd  ${response.body}');
    // Getting Server response into variable.
    var message = jsonDecode(response.body);



    List<ShopUser> CRO = List<ShopUser>.from(
        message.map((model) => ShopUser.fromJson(model)));
    // If Web call Success than Hide the CircularProgressIndicator.
    if(CRO.length>0){
      //Navigator.pushNamed(context, HomeScreen.routeName);
      usr=CRO[0];
      //demoCarts.clear();
      demoCarts.forEach((element) {
        
      });

      //var data = { };
      print('usr.vendor==1  ${usr.vendor=='1'}');
      if(usr.vendor=='1'){
        var datas = { 'shop_id':'${usr.shopId}' };
        var url = Uri.parse('${weburi}/load_product_shop.php');
        var responsep = await http.post(url, body: json.encode(datas));
        log('ddddddd  ${responsep.body}');
        // Getting Server response into variable.
        var messagep = jsonDecode(responsep.body);
        setState(() {
          Shop1 = List<Product>.from(
              messagep.map((model) => Product.fromJson(model)));
        });
      }else{
        var datas = {  };
        var url = Uri.parse('${weburi}/load_product.php');
        var responsep = await http.post(url, body: json.encode(datas));
        log('ddddddd  ${responsep.body}');
        // Getting Server response into variable.
        var messagep = jsonDecode(responsep.body);
        setState(() {
          Shop1 = List<Product>.from(
              messagep.map((model) => Product.fromJson(model)));
        });

      }







      Navigator.pushNamed(context, LoginSuccessScreen.routeName);

    }else{
      addError(error: kNotFoundUser);
    }
    /*for (var row in results) {
      print('Name: ${row[0]}');
    }

     */
    setState(() {
      _isLoading = false;
    });
    print('_signupClick  end');

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "เข้าระบบ",
            press: () async {
              Navigator.pushNamed(context,SignInScreen.routeName);                //  _isLoading = true;

            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "ลงทะเบียน",
            press: () async {
              Navigator.pushNamed(context,SignUpScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      //initialValue: "Krit12345",
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 4) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 4) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        //labelStyle:  TextStyle(color: Colors.white),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      //initialValue: "kritsanai@harmonious.co.th",
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        //labelStyle:  TextStyle(color: Colors.white),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
