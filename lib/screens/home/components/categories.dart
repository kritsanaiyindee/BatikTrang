import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/product_list/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [];

    if(usr.shopId=="1"){
     categories = [
    {"icon": "assets/icons/ShopIcon.svg", "text": "โชคกมลรัตน์ผ้าบาติก","shop":"/shop1"},
    ];
    }else if(usr.shopId=="2"){
    categories = [
    {"icon": "assets/icons/ShopIcon.svg", "text": "โต๊ะเมืองบาติก","shop":"/shop2"},
    ];
    }else if(usr.shopId=="3"){
    categories = [
    {"icon": "assets/icons/ShopIcon.svg", "text": "พญาบาติก","shop":"/shop3"},
    ];
    }else if(usr.shopId=="4"){
    categories = [
    {"icon": "assets/icons/ShopIcon.svg", "text": "พีเจบาติก","shop":"/shop4"},
    ];

    }else{
    categories = [
    {"icon": "assets/icons/ShopIcon.svg", "text": "โชคกมลรัตน์ผ้าบาติก","shop":"/shop1"},
    {"icon": "assets/icons/ShopIcon.svg", "text": "โต๊ะเมืองบาติก","shop":"/shop2"},
    {"icon": "assets/icons/ShopIcon.svg", "text": "พญาบาติก","shop":"/shop3"},
    {"icon": "assets/icons/ShopIcon.svg", "text": "พีเจบาติก","shop":"/shop4"},

    ];
    }
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {

                Navigator.pushNamed(context,categories[index]["shop"]);


            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center,style: TextStyle(color: kTextColorWhite),)
          ],
        ),
      ),
    );
  }
}
