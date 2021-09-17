import 'package:batiktrang/models/Cart.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/profile/profile_screen.dart';
import 'package:batiktrang/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            numOfitem: demoCarts.length,
            svgSrc: "assets/icons/CartIcon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/UserIcon.svg",
            //numOfitem: 3,
            press: () {
              if(usr.email!=null){
                Navigator.pushNamed(context, ProfileScreen.routeName);
              }else{
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
              //Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
