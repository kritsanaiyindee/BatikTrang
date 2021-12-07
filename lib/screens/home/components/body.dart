import 'package:batiktrang/models/shopuser.dart';
import 'package:batiktrang/screens/home/components/shop_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';


  class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
  }

  class _BodyState extends State<Body> {



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
        {"icon": "assets/icons/ShopIcon.svg", "text": "พีเจบาติก","shop":"/shop4"},
        {"icon": "assets/icons/ShopIcon.svg", "text": "พีเจบาติก","shop":"/shop4"},
        {"icon": "assets/icons/ShopIcon.svg", "text": "พีเจบาติก","shop":"/shop4"},

      ];
    }
    return
      SafeArea(
      //  padding: const EdgeInsets.only(bottom: 8.0),
      child:
      SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
        GridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 40.0,
              mainAxisSpacing: 40.0,
              padding: const EdgeInsets.all(20.0),
            children: List.generate(categories.length, (index) {
                return CategoryCard(
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],

                  press: () {

                    Navigator.pushNamed(context,categories[index]["shop"]);


                  },
                );
              }),



        ),
     //   )


         //   SizedBox(height: getProportionateScreenWidth(10)),
            ShopLocations(),
           // SpecialOffers(),
        //    SizedBox(height: getProportionateScreenWidth(30)),
         //   PopularProducts(),
       //     SizedBox(height: getProportionateScreenWidth(30)),
          ],
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
              height: getProportionateScreenWidth(100),
              width: getProportionateScreenWidth(100),
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