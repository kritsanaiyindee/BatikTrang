import 'package:flutter/material.dart';
import 'package:batiktrang/screens/sign_up_sellers//sign_up_screen.dart';
import '../constants.dart';
import '../size_config.dart';

class NoAccountSellerText extends StatelessWidget {
  const NoAccountSellerText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ลงทะเบียนผู้ขาย? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpSellerScreen.routeName),
          child: Text(
            "ลงทะเบียน",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
