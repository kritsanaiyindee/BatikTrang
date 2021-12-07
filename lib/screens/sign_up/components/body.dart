import 'package:batiktrang/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/components/socal_card.dart';
import 'package:batiktrang/constants.dart';
import 'package:batiktrang/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => new _BodyState();
}
class _BodyState extends State<Body> {

  int currentPage = 0;
  int _radioValue1=0;
  List<Map<String, String>> splashData = [
    {
      "text": "Batik Trang",
      "image": "assets/images/logo.jpg"
    },
  ];

  void _changeRadioValue(int? value) {
    setState(() {
      _radioValue1 = value!;

      switch (_radioValue1) {
        case 0:

          break;
        case 1:

          break;
        case 2:
           break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("ลงทะเบียน" ,style: TextStyle(color: Colors.white,fontSize: 24),),
                Image.asset("assets/images/logo.jpg",
                     height: getProportionateScreenHeight(100),
                  width: getProportionateScreenWidth(100),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 0,
                      groupValue: _radioValue1,
                      onChanged: _changeRadioValue,
                    ),
                    new Text(
                      'ลูกค้า',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue1,
                      onChanged: _changeRadioValue,
                    ),
                    new Text(
                      'ร้านค้า',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                  ],
                ),
                //SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(

                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
