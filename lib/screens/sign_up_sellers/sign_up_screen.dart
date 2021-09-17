import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpSellerScreen extends StatelessWidget {
  static String routeName = "/sign_up_sellers";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ลงทะเบียน"),
      ),
      body: Body(),
    );
  }
}
