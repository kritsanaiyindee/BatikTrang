import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/complete_profile/complete_profile_screen.dart';
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:batiktrang/screens/order_list/order_list.dart';
import 'package:batiktrang/screens/shop_buy_list/shop_buy_list.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/UserIcon.svg",
            press: () => {
              Navigator.pushNamed(context, CompleteProfileScreen.routeName)
            },
          ),
          ProfileMenu(
            text: "รายการสั่งซื้อ",
            icon: "assets/icons/receipt.svg",
            press: () {
              Navigator.pushNamed(context, OrderListScreen.routeName);

            },
          ),
          /*
          ProfileMenu(
            text: "ตั้งค่า",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),

           */
          ProfileMenu(
            text: "ที่อยู่",
            icon: "assets/icons/Locationpoint.svg",
            press: () {},
          ),
          if(usr.vendor=="1")
            ProfileMenu(
              text: "ร้านของฉัน",
              icon: "assets/icons/ShopIcon.svg",
              press: () {
                Navigator.pushNamed(context, ShopBuyListScreen.routeName);
              },
            ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Logout.svg",
            press: () {
              print('log out');
              usr=new ShopUser();
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
