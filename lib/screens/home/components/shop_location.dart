import 'package:batiktrang/screens/product_list/product_list.dart';

import 'package:batiktrang/screens/profile/components/location1.dart';
import 'package:batiktrang/screens/profile/components/location2.dart';
import 'package:batiktrang/screens/profile/components/location3.dart';
import 'package:batiktrang/screens/profile/components/location4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ShopLocations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  //  const LatLng _Praya = LatLng(7.806820621462803, 99.5640122288329);
  //  const LatLng _PJ = LatLng(7.7180347299396885, 99.67597380933788);
  //  const LatLng _tm = LatLng(7.443838181759113, 99.54926246523647);
  //  const LatLng _choke = LatLng(7.575327728724853, 99.61740267202796);
    const LatLng _Praya = LatLng(7.806820621462803, 99.5640122288329);
    const LatLng _PJ = LatLng(7.7180347299396885, 99.67597380933788);
    const LatLng _tm = LatLng(7.443838181759113, 99.54926246523647);
    const LatLng _choke = LatLng(7.575327728724853, 99.61740267202796);
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Locationpoint.svg", "text": "โชคกมลรัตน์ผ้าบาติก","shop":"/shop1","loc":"โชคกมลรัตน์บาติก 119/226 ถ.รักษ์จันทร์ หมู่ 5. นาตาล่วง เมือง. ตรัง 92000"
        ,"lat":7.575327728724853,"lng":99.61740267202796,"LatLng":_choke},
      {"icon": "assets/icons/Locationpoint.svg", "text": "โต๊ะเมืองบาติก","shop":"/shop2","loc":"กลุ่มโต๊ะเมืองบาติก ต.บางหมาก อ.กันตัง จ.ตรัง 92110"
        ,"lat":7.443838181759113,"lng":99.54926246523647,"LatLng":_tm},
      {"icon": "assets/icons/Locationpoint.svg", "text": "พญาบาติก","shop":"/shop3","loc":"พญาบาติก(phaya​ batik)​ 69​ หมู่​ 7​ เขา​กอบ​ ห้วยยอด​ Trang 92130 "
        ,"lat":7.806820621462803,"lng":99.5640122288329,"LatLng":_Praya},
      {"icon": "assets/icons/Locationpoint.svg", "text": "พีเจบาติก","shop":"/shop4","loc":"PJบาติก 4123 ตำบลปากแจ่ม, ห้วยยอด, จังหวัดตรัง 92190"
        ,"lat":7.7180347299396885,"lng":99.67597380933788,"LatLng":_PJ},

    ];
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
              if(index==0)
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MarkerIconsBody1(location:categories[index]["loc"],
                  name:categories[index]["text"],
                  lat:categories[index]["lat"],
                  lng:categories[index]["lng"],
                  //LatLng:categories[index]["LatLng"],
              )
              ));
              if(index==1)
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MarkerIconsBody2(location:categories[index]["loc"],
                  name:categories[index]["text"],
                  lat:categories[index]["lat"],
                  lng:categories[index]["lng"],
                  //LatLng:categories[index]["LatLng"],
                )
                ));
              if(index==2)
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MarkerIconsBody3(location:categories[index]["loc"],
                  name:categories[index]["text"],
                  lat:categories[index]["lat"],
                  lng:categories[index]["lng"],
                  //LatLng:categories[index]["LatLng"],
                )
                ));
              if(index==3)
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MarkerIconsBody4(location:categories[index]["loc"],
                  name:categories[index]["text"],
                  lat:categories[index]["lat"],
                  lng:categories[index]["lng"],
                  //LatLng:categories[index]["LatLng"],
                )
                ));











               // Navigator.pushNamed(context,"/map");
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
