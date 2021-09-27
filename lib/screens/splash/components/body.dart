import 'package:batiktrang/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:batiktrang/constants.dart';
import 'package:batiktrang/screens/sign_in/sign_in_screen.dart';
import 'package:batiktrang/size_config.dart';
import 'package:batiktrang/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Batik Trang",
      "image": "assets/images/logo.jpg"
    },
    {
      "text":
          "ซื้อง่ายขายคล่อง",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "ราคาดีที่สุด",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(

              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "ถัดไป",
                      press: () async {
                        var data = { };
                        showLoaderDialog(context);
                        var url = Uri.parse('${weburi}/load_product.php');
                        var responsep = await http.post(url, body: json.encode(data));
                        print('ddddddd  ${responsep.body}');
                        // Getting Server response into variable.
                        var messagep = jsonDecode(responsep.body);
                        setState(() {
                          Shop1 = List<Product>.from(
                              messagep.map((model) => Product.fromJson(model)));
                        });
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("เข้าสู่ระบบ..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.pinkAccent : Colors.white,//Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
