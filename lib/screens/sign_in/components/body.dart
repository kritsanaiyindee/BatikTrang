import 'package:flutter/material.dart';
import 'package:batiktrang/components/no_account_text.dart';
import 'package:batiktrang/components/no_account_seller_text.dart';
import 'package:batiktrang/components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "ยินดีต้อนรับ",
                  style: TextStyle(
                    //color: Colors.white,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset("assets/images/logo.jpg",
                  height: getProportionateScreenHeight(200),
                  width: getProportionateScreenWidth(200),
                ),
                /*
                Text(
                  "เข้าสู่ระบบด้วยอีเมล์และรหัสผ่านของคุณ  \หรือด้วย social media",
                  textAlign: TextAlign.center,
                ),

                 */
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),

                //NoAccountText(),
               // NoAccountSellerText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
