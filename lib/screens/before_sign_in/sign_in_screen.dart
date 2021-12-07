import 'package:flutter/material.dart';


import '../../constants.dart';
import 'components/body.dart';

class BeforeSignInScreen extends StatelessWidget {
  static String routeName = "/before_sign_in";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor:logoColor ,
      appBar: AppBar(
        title: Text("เข้าสู่ระบบ",style: TextStyle(color: Colors.white),),
        backgroundColor:logoColor ,
        //title: Text("เข้าสู่ระบบ",style: TextStyle(color: Colors.white),),
      ),
      body: Body(),
    );
  }
}
