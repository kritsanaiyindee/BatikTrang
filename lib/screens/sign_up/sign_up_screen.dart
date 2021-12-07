import 'package:batiktrang/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:logoColor ,
      appBar: AppBar(

        backgroundColor:logoColor ,
        title: Text("เข้าสู่ระบบ",style: TextStyle(color: Colors.white),),
      ),
      body: Body(),
    );
  }
}
