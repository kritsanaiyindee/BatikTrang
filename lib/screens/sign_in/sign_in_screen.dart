import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
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
