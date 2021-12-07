import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/before_sign_in/sign_in_screen.dart';
import 'package:batiktrang/screens/product_image_upload/product_screen.dart';
import 'package:batiktrang/screens/product_list/product_list.dart';
import 'package:batiktrang/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:batiktrang/screens/profile/profile_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/FlashIcon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              /*
              IconButton(
                icon: SvgPicture.asset("assets/icons/HeartIcon.svg"),
                onPressed: () {},
              ),

               */
              IconButton(
                icon: SvgPicture.asset("assets/icons/ShopIcon.svg",
                  color: MenuState.message == selectedMenu
                  ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                      Navigator.pushNamed(context, ProductsListScreen.routeName);

                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/UserIcon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed:(){
                  print('xxxxxxxxxxxxxxxxxxxxxxxx${usr.email}');
                  if(usr.email!=null){
                    Navigator.pushNamed(context, ProfileScreen.routeName);
                  }else{
                    Navigator.pushNamed(context, BeforeSignInScreen.routeName);
                  }
                }


              //    Navigator.pushNamed(context, SignInScreen.routeName)
                ,
              ),

              if(usr.vendor=="1"||usr.admin=="1")IconButton(
                color: MenuState.favourite == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                icon: SvgPicture.asset("assets/icons/PlusIcon.svg"),
                onPressed: () {
                  Navigator.pushNamed(context, UploadProductScreen.routeName);


                },
              ),


            ],
          )),
    );
  }
}
