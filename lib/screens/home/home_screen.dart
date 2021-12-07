import 'package:batiktrang/models/Cart.dart';
import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/cart/cart_screen.dart';
import 'package:batiktrang/screens/profile/profile_screen.dart';
import 'package:batiktrang/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/components/coustom_bottom_nav_bar.dart';
import 'package:batiktrang/enums.dart';

import '../../constants.dart';
import 'components/body.dart';
import 'components/icon_btn_with_counter.dart';
import 'components/search_field.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        //leading: Icon(Icons.search),
        title: Text(''),
        actions: [
          SearchField(),
          IconBtnWithCounter(
            numOfitem: demoCarts.length,
            svgSrc: "assets/icons/CartIcon.svg",
            //press: () => Navigator.pushNamed(context, CartScreen.routeName),
            press:(){
              print('xxxxxxxxxxxxxxxxxxxxxxxx${usr.email}');
              if(usr.email!=null){
                Navigator.pushNamed(context, CartScreen.routeName);
              }else{
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            }
            ,
          ),
          /*
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

           */
        ],
        backgroundColor: logoColor,
      ),
      body: Body(),
      backgroundColor: logoColor,
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

    );
  }
}
